import 'package:barber/config/api-endpoint.dart';
import 'package:barber/config/routes.dart';
import 'package:barber/models/hair-data.dart';
import 'package:barber/models/technic-time-data.dart';
import 'package:barber/models/user-data.dart';
import 'package:barber/network/request-exception.dart';
import 'package:barber/network/request.dart';
import 'package:barber/screens/Customer/Home/home-user-controller.dart';
import 'package:barber/screens/auth-controller.dart';
import 'package:barber/utils/load-request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

class DrawerLourTea extends StatelessWidget {
  const DrawerLourTea({Key? key}) : super(key: key);

  //  ReserveData(
  // date: Get.arguments['date'],
  // hairCut: Get.arguments['hairData'],
  // nameTechic: Get.arguments['technic'].fullName,
  // time: Get.arguments['time'].timeString,
  //                     ),

  Future<void> viewLastedBooking() async {
    loadRequest(() async {
      try {
        final userData = Get.find<UserData>();
        var res = await getRequest(
          path: "${APIEndpoint.hostName}/user/booking/${userData.userId}",
        );
        if (res['message'] == "สำเร็จ") {
          res = res['booking'];
          Get.toNamed(Routes.paymentSummary, arguments: {
            "hairData": HairData.fromJson(res['hairData']),
            "technic": UserData.fromJson(res['technicData']),
            "time": TechnicTimeData.fromJson(
              res['scheduleData']
                ..['isAvalible'] =
                    99999 //<-- dont care this value but must set for avoid null error !
                ..['dateWork'] = "", //<-- this also!
            ),
            "date": res['date_select'],
          });
        }
      } on RequestException catch (e) {
        print("Exception");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: Get.width * 0.65,
      child: Container(
        child: LayoutBuilder(
          builder: (context, ctr) {
            return SafeArea(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: ctr.maxWidth * 0.5,
                  ),
                  Gap(10),
                  Image.asset(
                    "assets/images/text-logo.png",
                    width: ctr.maxWidth * 0.7,
                  ),
                  Gap(10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          getMenu(
                              icon: Icons.access_alarm,
                              text: 'รายละเอียดการจอง',
                              onTap: () {
                                viewLastedBooking();
                              }),
                          getMenu(
                            icon: Icons.table_chart_outlined,
                            text: 'ประวัติการจอง',
                            onTap: () {
                              final homeController =
                                  Get.find<HomeUserController>();
                              if (homeController.pageSwapHistory.page! >= 1) {
                                homeController.pageSwapHistory.animateTo(
                                  0,
                                  duration: 300.milliseconds,
                                  curve: Curves.decelerate,
                                );
                                homeController.globalKey.currentState!
                                    .closeDrawer();
                                return;
                              }
                              loadRequest(() async {
                                await homeController.fetchHistory();
                                homeController.globalKey.currentState!
                                    .closeDrawer();
                                await Future.delayed(500.milliseconds);
                                homeController.pageSwapHistory.animateTo(
                                  homeController
                                      .pageSwapHistory.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.decelerate,
                                );
                              });
                            },
                          ),
                          getMenu(
                            icon: Icons.person_outline_outlined,
                            text: 'โปร์ไฟล์',
                          ),
                          getMenu(
                            icon: Icons.notifications_none_outlined,
                            text: 'การแจ้งเตือน',
                          ),
                        ],
                      ),
                    ),
                  ),
                  getMenu(
                    icon: Icons.logout,
                    text: 'ออกจากระบบ',
                    onTap: () {
                      Get.find<AuthController>().logout();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget getMenu({icon, text, onTap}) {
  return Container(
    height: 50,
    child: ListTile(
      onTap: onTap ?? () {},
      leading: Container(
        margin: EdgeInsets.only(left: 5),
        child: Icon(
          icon,
          color: Colors.grey[800],
          size: 30,
        ),
      ),
      minLeadingWidth: 20,
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    ),
  );
}
