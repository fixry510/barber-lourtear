import 'package:barber/config/routes.dart';
import 'package:barber/models/hair-data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';

class HairItem extends StatelessWidget {
  late HairData hairData;
  HairItem({required this.hairData});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, -0.8),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(
            Routes.hairDetail,
            arguments: hairData,
          );
        },
        child: Container(
          width: Get.width * 0.8,
          height: Get.width * 0.8,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ImageFade(
                image: NetworkImage(
                  hairData.images[0].imageUrl,
                ),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  // height: 30,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text(
                    hairData.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
