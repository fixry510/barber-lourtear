import 'package:barber/config/api-endpoint.dart';
import 'package:barber/config/routes.dart';
import 'package:barber/network/request-exception.dart';
import 'package:barber/network/request.dart';
import 'package:barber/screens/Customer/HairDetail/hair-detail-controller.dart';
import 'package:barber/screens/Customer/HairDetail/hair-detail.dart';
import 'package:barber/screens/Customer/Payment/payment-success.dart';
import 'package:barber/utils/load-request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CreditCardController extends GetxController {
  final numberCard = TextEditingController();
  final nameOnCard = TextEditingController();
  final expiryDate = TextEditingController();
  final cvc = TextEditingController();

  Future<void> onPaymentCredit() async {
    String isSuccess = await loadRequest(() async {
      try {
        String price =
            Get.find<HairDetailController>().hairData.price.toString();
        print(numberCard.text);
        print(nameOnCard.text);
        print(expiryDate.text);
        print(cvc.text);
        final data = await postRequest(
            path: "${APIEndpoint.hostName}/creditcard",
            data: {
              "amount": price + "00",
              "name": nameOnCard.text.trim(),
              "expiryMonth": expiryDate.text.split("/")[0],
              "expiryYear": expiryDate.text.split("/")[1],
              "cardNumber": numberCard.text.split("-").join(""),
              "cvc": cvc.text,
            });
        print(data["message"]);
        return data['message'];
      } on RequestException catch (e) {}
    });
    if (isSuccess == "ชำระเงินสำเร็จ") {
      await Get.bottomSheet(
        PaymentSuccess(),
        barrierColor: Colors.black45,
      );
      Future.delayed(300.milliseconds, () {
        Get.offNamedUntil(
          Routes.paymentSummary,
          ModalRoute.withName(Routes.homeUser),
        );
      });
    }
  }
}
