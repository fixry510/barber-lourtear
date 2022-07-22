import 'package:barber/screens/auth-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTechnician extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.find<AuthController>().logout();
          },
          child: Text("Home Technician"),
        ),
      ),
    );
  }
}
