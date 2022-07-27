import 'package:barber/models/user-data.dart';
import 'package:barber/screens/Customer/HairDetail/hair-detail-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingDetailData extends GetView<HairDetailController> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserData>();
    return Material(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.grey[50],
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ชื่อ : ${userController.fullName}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "ทรงผม : ${controller.hairCutController.text} ราคา ${controller.hairData.price} บาท",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "ช่าง : ช่าง ${controller.selectTechnicData['technic'].fullName}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "วันที่จอง : ${controller.selectTechnicData['date']}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "วันที่จอง : ${controller.selectTechnicData['date']}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "เวลาที่จอง : ${controller.selectTechnicData['time'].timeString}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
