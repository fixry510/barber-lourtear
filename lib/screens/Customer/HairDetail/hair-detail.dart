import 'package:barber/models/hair-data.dart';
import 'package:barber/screens/Customer/HairDetail/booking-queue.dart';
import 'package:barber/screens/Customer/HairDetail/hair-detail-controller.dart';
import 'package:barber/screens/Customer/HairDetail/hair-image-show.dart';
import 'package:barber/utils/backround-main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HairDetail extends StatelessWidget {
  HairDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HairDetailController>(
      init: HairDetailController(),
      builder: (controller) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.orange[50],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "${controller.hairData.name}",
              style: TextStyle(
                fontFamily: 'Roboot',
                // fontSize: 20,
              ),
            ),
            centerTitle: false,
          ),
          body: BackGroundMain(
              child: SafeArea(
            child: Column(
              children: [
                HairImageShow(),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ราคา ${controller.hairData.price} บาท",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              controller.hairData.description,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.bottomSheet(
                          GestureDetector(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: BookingQueue(),
                          ),
                          isDismissible: false,
                          enableDrag: false
                          // isScrollControlled: true,
                          );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xff00a1ba),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'จองคิว',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
