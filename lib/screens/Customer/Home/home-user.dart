import 'package:barber/models/user-data.dart';
import 'package:barber/screens/Customer/Home/hair-items.dart';
import 'package:barber/screens/Customer/Home/home-user-controller.dart';
import 'package:barber/screens/auth-controller.dart';
import 'package:barber/utils/backround-main.dart';
import 'package:barber/utils/load-widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Get.find<UserData>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        title: Text(
          "Loar Tear Barber",
          style: TextStyle(
            fontFamily: 'Roboot',
            // fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.find<AuthController>().logout();
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: BackGroundMain(
        child: SafeArea(
          child: GetBuilder<HomeUserController>(
            init: HomeUserController(),
            builder: (controller) => Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "สวัสดี",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${userData.fullName}",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Obx(
                    () => controller.isLoad.value
                        ? LoadWidget()
                        : Expanded(
                            child: HairItems(),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
