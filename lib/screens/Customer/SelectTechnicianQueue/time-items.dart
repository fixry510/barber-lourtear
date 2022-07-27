import 'package:barber/screens/Customer/SelectTechnicianQueue/select-technician-queue-controller.dart';
import 'package:barber/screens/Customer/SelectTechnicianQueue/time-item.dart';
import 'package:barber/utils/load-widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeItems extends StatelessWidget {
  final controller = Get.find<SelectTechnicianQueueController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return controller.isLoad.value
            ? LoadWidget()
            : ListView(
                padding: EdgeInsets.zero,
                children: [
                  ...controller.technicTimeData.map((technicTimeData) {
                    return TimeItem(technicTimeData: technicTimeData);
                  }).toList()
                ],
              );
      }),
    );
  }
}
