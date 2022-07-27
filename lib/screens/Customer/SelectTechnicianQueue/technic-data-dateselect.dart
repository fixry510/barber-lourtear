import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'select-technician-queue-controller.dart';

class TechnicDataDateSelect extends StatelessWidget {
  final controller = Get.find<SelectTechnicianQueueController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ช่าง ${controller.technic.fullName}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        GestureDetector(
          onTap: () async {
            controller.selectDateQueue();
          },
          child: Text(
            'วันที่ ${controller.currentDate}',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
