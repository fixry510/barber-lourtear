import 'package:barber/models/technic-time-data.dart';
import 'package:barber/screens/Customer/SelectTechnicianQueue/select-technician-queue-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeItem extends StatelessWidget {
  final TechnicTimeData technicTimeData;

  TimeItem({Key? key, required this.technicTimeData}) : super(key: key);

  final controller = Get.find<SelectTechnicianQueueController>();

  bool checkIsBefore() {
    DateTime datetimeNow = DateTime.now();

    int selectDateYear = int.parse(controller.currentDate.split("/")[2]);
    int selectDateMount = int.parse(controller.currentDate.split("/")[1]);
    int selectDateDay = int.parse(controller.currentDate.split("/")[0]);

    int startHour = int.parse(technicTimeData.fromTime.split(":")[0]);
    int startMinute = int.parse(technicTimeData.fromTime.split(":")[1]);

    DateTime queuDateTime = DateTime(
      selectDateYear,
      selectDateMount,
      selectDateDay,
      startHour,
      startMinute,
    );

    return datetimeNow.isBefore(queuDateTime);
  }

  @override
  Widget build(BuildContext context) {
    bool isBefore = checkIsBefore();
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (technicTimeData.isAvalible == 1) {
            Get.back(result: {
              "time": technicTimeData,
              "date": Get.find<SelectTechnicianQueueController>().currentDate,
            });
            Get.back();
          }
        },
        child: Center(
          child: Container(
            width: Get.width * 0.65,
            decoration: BoxDecoration(
              // color: isBefore ? Colors.grey[500] : null,
              borderRadius: BorderRadius.circular(15),
            ),
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
                  endIndent: 10,
                  indent: 10,
                ),
              ],
            ),
          ),
        ),
      );
  }
}
