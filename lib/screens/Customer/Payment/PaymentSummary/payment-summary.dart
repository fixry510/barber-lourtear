import 'package:barber/screens/Customer/Payment/PaymentSummary/reserve-data.dart';
import 'package:barber/utils/backround-main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({Key? key}) : super(key: key);
  // {
  //       "time": selectTechnicData['time'],
  //       "technic": selectTechnicData['technic'],
  //       "date": selectTechnicData['date'],
  //       "hairData": hairData,
  //     };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.orange[50],
      body: BackGroundMain(
        height: Get.height * 0.65,
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                "assets/images/text-logo.png",
                width: 250,
                height: 150,
                color: Colors.white,
              ),
              Text(
                "ขอบคุณสำหรับการชำระเงิน",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Lottie.asset(
                            "assets/lottie/success.json",
                            width: 150,
                            height: 150,
                            repeat: false,
                          ),
                        ),
                        //                     {
                        //   "time": selectTechnicData['time'],
                        //   "technic": selectTechnicData['technic'],
                        //   "date": selectTechnicData['date'],
                        //   "hairData": hairData,
                        // };
                        ReserveData(
                          date: Get.arguments['date'],
                          hairCut: Get.arguments['hairData'],
                          nameTechic: Get.arguments['technic'].fullName,
                          time: Get.arguments['time'].timeString,
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            'คำเตือน',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            '       ถ้าคุณมาช้าเกินกว่าเวลาที่ที่คุณจองระบบจะไม่ทำการคืนเงินให้คุณทุกกรณี รบกวนคุณลูกค้ามาให้ตรงเวลา หรือ มาก่อนเวลาด้วยนะครับ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: Container(
                            height: 40,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Color(0xff00a1ba),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'ยอมรับ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
