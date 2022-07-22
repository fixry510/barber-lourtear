import 'package:barber/screens/Register/register-controller.dart';
import 'package:barber/utils/background-curves.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.orange,
            size: 30,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BackGroudCurve(
          child: SafeArea(
            child: Container(
              height: Get.height,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/text-logo.png",
                    width: 250,
                  ),
                  Text(
                    "ยืนยันตัวตน",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            // width: 300,
                            child: PinCodeTextField(
                              // controller: otpController,
                              keyboardType: TextInputType.number,
                              appContext: context,
                              length: 6,
                              animationType: AnimationType.slide,
                              animationDuration: Duration(milliseconds: 100),
                              boxShadows: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.grey[400]!,
                                  offset: Offset(-1, 1.5),
                                  spreadRadius: -1,
                                  blurStyle: BlurStyle.outer,
                                ),
                                BoxShadow(
                                  blurRadius: 0,
                                  color: Colors.white,
                                  spreadRadius: 0,
                                  offset: Offset(0, 0),
                                  blurStyle: BlurStyle.outer,
                                ),
                              ],
                              onChanged: (text) {},
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderWidth: 1.5,
                                fieldOuterPadding: EdgeInsets.zero,
                                borderRadius: BorderRadius.circular(10),
                                fieldHeight: 45,
                                fieldWidth: 45,
                                selectedColor: Colors.orange,
                                activeColor: Colors.orange,
                                inactiveColor: Colors.white,
                              ),
                              onCompleted: (text) {},
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(''),
                              Text(
                                'ส่งรหัสยืนยัน',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Text(
                            'รหัสยืนยันจะถูกส่งให้คุณ  รหัส OTP จะมีเวลา 5 นาทีในการยืนยัน',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 40),
                          Container(
                            width: Get.width * 0.5,
                            child: ElevatedButton(
                              onPressed: () {
                                // Get.toNamed(Routes.otpScreen);
                                Get.find<RegisterController>().onRegister();
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Text(
                                'ยืนยันการสมัคร',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
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
      ),
    );
  }
}
