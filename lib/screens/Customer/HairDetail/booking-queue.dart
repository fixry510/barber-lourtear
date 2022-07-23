import 'package:barber/config/routes.dart';
import 'package:barber/screens/Customer/HairDetail/hair-detail-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingQueue extends StatelessWidget {
  final hairDetailController = Get.find<HairDetailController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 380,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              height: 380 - 30,
              child: Column(
                children: [
                  Text(
                    "กรอกข้อมูล",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  getTextField(
                    hintText: 'Email',
                    icon: Icons.person,
                    controller: hairDetailController.emailController,
                  ),
                  getTextField(
                    hintText: 'Phone',
                    icon: Icons.phone,
                    controller: hairDetailController.phoneController,
                  ),
                  getTextField(
                    hintText: 'รายการทรงผม',
                    icon: Icons.cut,
                    controller: hairDetailController.hairCutController,
                    readOnly: true,
                  ),
                  getTextField(
                    hintText: 'เลือกช่างตัดผมและเวลา',
                    icon: Icons.accessibility_new,
                    controller: hairDetailController.techController,
                    isSelectTechnic: true,
                  ),
                  // getTextField(
                  //   hintText: 'เลือกวันและเวลาของคุณ',
                  //   icon: Icons.date_range,
                  //   controller: controller.dateTimeController,
                  // ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xff00a1ba),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        'ทำการจองคิว',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.cancel,
              size: 30,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}

Widget getTextField(
    {hintText, controller, icon, readOnly = false, isSelectTechnic = false}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 8),
    height: 42,
    child: isSelectTechnic
        ? GestureDetector(
            onTap: () {
              Navigator.of(Get.context!).pushNamed(Routes.selectTechnician);
              // Get.toNamed(Routes.selectTechnician);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(icon, color: Colors.grey[500]!),
                  SizedBox(width: 10),
                  Text(
                    hintText,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
            ),
          )
        : TextField(
            controller: controller,
            readOnly: readOnly,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: hintText,
              contentPadding: EdgeInsets.only(top: (42 / 2) - 40, left: 10),
              prefixIcon: Icon(icon, color: Colors.grey[500]!),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
  );
}
