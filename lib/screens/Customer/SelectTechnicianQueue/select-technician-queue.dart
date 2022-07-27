import 'package:barber/screens/Customer/SelectTechnicianQueue/select-technician-queue-controller.dart';
import 'package:barber/screens/Customer/SelectTechnicianQueue/technic-data-dateselect.dart';
import 'package:barber/screens/Customer/SelectTechnicianQueue/time-items.dart';
import 'package:barber/utils/backround-main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                          child: TechnicDataDateSelect(),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Expanded(child: TimeItems()),
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
