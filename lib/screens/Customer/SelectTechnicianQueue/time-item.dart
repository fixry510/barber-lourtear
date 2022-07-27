import 'package:barber/models/technic-time-data.dart';
import 'package:barber/screens/Customer/SelectTechnicianQueue/select-technician-queue-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeItem extends StatelessWidget {
  final TechnicTimeData technicTimeData;

  TimeItem({Key? key, required this.technicTimeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (technicTimeData.isAvalible == 1) {
          Get.back(result: {
            "time": technicTimeData,
            "date": Get.find<SelectTechnicianQueueController>().currentDate,
          });
          Get.back();
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  technicTimeData.timeString,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: technicTimeData.isAvalible == 1
                        ? Colors.green
                        : Colors.red[800],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
              endIndent: 30,
              indent: 30,
            ),
          ],
        ),
      ),
    );
  }
}
