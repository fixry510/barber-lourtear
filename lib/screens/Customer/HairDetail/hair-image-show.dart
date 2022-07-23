import 'package:barber/models/hair-data.dart';
import 'package:barber/screens/Customer/HairDetail/hair-detail-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:image_fade/image_fade.dart';

class HairImageShow extends StatelessWidget {
  HairImageShow({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HairDetailController>();
    final HairData hairData = controller.hairData;
    return Container(
      height: 350,
      padding: EdgeInsets.all(20),
      child: Obx(
        () {
          int selectImageIndex = controller.currentSelectImage.value;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  // height: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      hairData.images[selectImageIndex].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      ...hairData.images.mapIndexed((index, hairImage) {
                        bool isLast = index == hairData.images.length - 1;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.onChangeSelectImage(index);
                            },
                            child: Container(
                              width: 80,
                              margin: EdgeInsets.only(
                                bottom: isLast ? 0 : 10,
                              ),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  ImageFade(
                                    image: NetworkImage(
                                      hairImage.imageUrl,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  if (selectImageIndex == index)
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          width: 3,
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList()
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
