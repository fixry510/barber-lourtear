import 'package:barber/models/hair-data.dart';
import 'package:barber/models/user-data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReserveData extends StatelessWidget {
  late HairData hairCut;
  late var nameTechic;
  late var date;
  late var time;

  ReserveData({
    required this.date,
    required this.hairCut,
    required this.nameTechic,
    required this.time,
  });

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
              "ทรงผม : ${hairCut.name} ราคา ${hairCut.price} บาท",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "ช่าง : ช่าง ${nameTechic}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "วันที่จอง : $date",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "เวลาที่จอง : $time",
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
