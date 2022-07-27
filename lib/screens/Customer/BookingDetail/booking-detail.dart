import 'package:barber/config/routes.dart';
import 'package:barber/screens/Customer/BookingDetail/booking-detail-data.dart';
import 'package:barber/screens/Customer/HairDetail/hair-detail-controller.dart';
import 'package:barber/utils/backround-main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingDetail extends StatelessWidget {
  const BookingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.orange[50],
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
                Text(
                  "รายละเอียดการจอง",
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
                          BookingDetailData(),
                          SizedBox(height: 40),
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
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.payment);
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
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.until(
                                        (_) =>
                                            Get.currentRoute == Routes.homeUser,
                                      );
                                    },
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'ยกเลิก',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
