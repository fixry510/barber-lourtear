import 'package:barber/screens/Customer/Payment/CreditCard/credit-card-controller.dart';
import 'package:barber/utils/backround-main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromtPay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.orange[50],
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BackGroundMain(
          height: Get.height * .35,
          child: SafeArea(
            child: GetBuilder<CreditCardController>(
              init: CreditCardController(),
              builder: (controller) => SingleChildScrollView(
                child: Container(
                  height: Get.height - Get.statusBarHeight,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/text-logo.png",
                        width: 250,
                        height: 150,
                        color: Colors.white,
                      ),
                      // SizedBox(height: 15),
                      Container(
                        width: Get.width * 0.9,
                        padding: EdgeInsets.all(30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Promt Pay",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              width: 300,
                              height: 350,
                              child: Image.network(
                                "http://localhost:9999/new-file.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: Get.width * 0.75,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  'คำเตือน',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '	ถ้าคุณมาช้าเกินกว่าเวลาที่ที่คุณจองระบบจะไม่ทำการคืนเงินให้คุณทุกกรณี รบกวนคุณลูกค้ามาให้ตรงเวลา หรือ มาก่อนเวลาด้วยนะครับ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                    // fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget getTextField(
    {text, controller, isCredit = false, isCvc = false, isExpire = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        ' $text : ',
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 12,
          fontFamily: '',
        ),
      ),
      SizedBox(height: 5),
      Container(
        height: 35,
        child: TextField(
          controller: controller,
          keyboardType:
              isCredit || isCvc || isExpire ? TextInputType.number : null,
          inputFormatters: [
            if (isCredit) MaskTextInputFormatter(mask: "####-####-####-####"),
            if (isExpire) MaskTextInputFormatter(mask: "##/####"),
            if (isCvc) MaskTextInputFormatter(mask: "###"),
          ],
          decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.only(
              top: (35 / 2) - 20,
              left: 10,
            ),
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    ],
  );
}
