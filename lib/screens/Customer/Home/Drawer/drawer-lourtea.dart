import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerLourTea extends StatelessWidget {
  const DrawerLourTea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: Get.width * 0.6,
      child: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
