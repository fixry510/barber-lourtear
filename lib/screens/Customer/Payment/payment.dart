import 'package:barber/config/routes.dart';
import 'package:barber/screens/Customer/HairDetail/hair-detail-controller.dart';
import 'package:barber/utils/backround-main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BackGroundMain(
        height: Get.height * 0.65,
        child: SafeArea(
          child: GetBuilder<HairDetailController>(
            builder: (controller) => Column(
              children: [
                Image.asset(
                  "assets/images/text-logo.png",
                  width: 250,
                  height: 150,
                  color: Colors.white,
                ),
                SizedBox(height: 50),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "เลือกช่องทางการชำระเงิน",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 5,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.creditCard);
                            },
                            child: Row(
                              children: [
                                SizedBox(width: 30),
                                Expanded(
                                  child: Center(
                                    child: Transform.translate(
                                      offset: Offset(0, -5),
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        child: Image.asset(
                                          "assets/images/creditcard.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Credit card",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 2,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: Color(0xFF2E7F8B),
                                  ),
                                ),
                                SizedBox(width: 20),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 5,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.promtpay);
                            },
                            child: Row(
                              children: [
                                SizedBox(width: 30),
                                Expanded(
                                  child: Center(
                                    child: Transform.scale(
                                      scale: 1.5,
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        child: Image.asset(
                                          "assets/images/promtpay.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Prompt Pay",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 2,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: Color(0xFF2E7F8B),
                                  ),
                                ),
                                SizedBox(width: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
