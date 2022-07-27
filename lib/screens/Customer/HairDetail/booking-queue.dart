import 'package:auto_size_text/auto_size_text.dart';
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
                  Obx(() {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(Get.context!)
                            .pushNamed(Routes.selectTechnician);
                      },
                      child: getBookingDetailField(),
                    );
                  }),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                      onPressed: () {
                        if (Get.find<HairDetailController>()
                            .selectTechnicData
                            .isNotEmpty) {
                          Get.toNamed(Routes.bookingDetail);
                        }
                      },
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

Widget getTextField({
  hintText,
  controller,
  icon,
  readOnly = false,
}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 8),
    height: 42,
    child: TextField(
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

Widget getBookingDetailField() {
  final hairDetailController = Get.find<HairDetailController>();
  Map selectTechnicData = hairDetailController.selectTechnicData;
  return Container(
    height: selectTechnicData.isEmpty ? 42 : 80,
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Icon(Icons.accessibility_new, color: Colors.grey[500]!),
        SizedBox(width: 10),
        if (selectTechnicData.isEmpty)
          Text(
            'เลือกช่างตัดผมและเวลา',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          )
        else
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'ช่าง : ',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'Kanit',
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: '${selectTechnicData['technic'].fullName}',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Kanit',
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'วันที่ : ',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'Kanit',
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: '${selectTechnicData['date']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Kanit',
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'เวลา : ',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'Kanit',
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: '${selectTechnicData['time'].timeString}',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Kanit',
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
      ],
    ),
  );
}
