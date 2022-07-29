import 'package:barber/config/routes.dart';
import 'package:barber/screens/Customer/HairDetail/hair-detail-controller.dart';
import 'package:barber/screens/Customer/SelectTechnician/select-technician-controller.dart';
import 'package:barber/screens/Customer/SelectTechnician/technic-item.dart';
import 'package:barber/utils/backround-main.dart';
import 'package:barber/utils/load-widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectTechnician extends StatelessWidget {
  const SelectTechnician({Key? key}) : super(key: key);

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
          child: GetBuilder<SelectTechnicianController>(
            init: SelectTechnicianController(),
            builder: (controller) => Column(
              children: [
                Image.asset(
                  "assets/images/text-logo.png",
                  width: 250,
                  height: 150,
                  color: Colors.white,
                ),
                Text(
                  "กรุณาเลือกช่าง",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 35),
                Expanded(
                  child: Obx(
                    () => controller.isLoad.value
                        ? LoadWidget()
                        : ListView(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            children: [
                              ...controller.technicians.map((techic) {
                                return GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () async {
                                    Get.toNamed(
                                      Routes.selectTechnicianQueue,
                                      arguments: techic,
                                    )?.then((value) {
                                      if (value != null) {
                                        Get.find<HairDetailController>()
                                                .selectTechnicData['technic'] =
                                            techic;
                                        Get.find<HairDetailController>()
                                                .selectTechnicData['time'] =
                                            value['time'];
                                        Get.find<HairDetailController>()
                                                .selectTechnicData['date'] =
                                            value['date'];
                                      }
                                    });
                                  },
                                  child: TechnicItem(techic: techic),
                                );
                              }).toList(),
                            ],
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
