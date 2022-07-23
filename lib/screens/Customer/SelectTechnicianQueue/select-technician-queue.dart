import 'package:barber/screens/Customer/SelectTechnicianQueue/select-technician-queue-controller.dart';
import 'package:barber/utils/backround-main.dart';
import 'package:barber/utils/date-select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SelectTechnicianQueue extends StatelessWidget {
  const SelectTechnicianQueue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BackGroundMain(
        height: Get.height * 0.65,
        child: SafeArea(
          child: GetBuilder<SelectTechnicianQueueController>(
            init: SelectTechnicianQueueController(),
            builder: (controller) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/text-logo.png",
                      width: 250,
                      height: 150,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200]!,
                            image: DecorationImage(
                              image:
                                  NetworkImage(controller.technic.profileImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
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
                                  final s = await showDateSelect(
                                      firstDate: DateTime.now());
                                  print(DateFormat("dd/MM/yyyy", "th")
                                      .format(s!));
                                },
                                child: Text(
                                  'วันที่ 12/02/2562',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
