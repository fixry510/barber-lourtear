import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

class BackGroudCurve extends StatelessWidget {
  final Widget child;
  BackGroudCurve({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: Get.height * 0.41,
                width: 500,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0, 1],
                    colors: [
                      // Colors.transparent,
                      Colors.orange[200]!,
                      Colors.orange[700]!,
                      // Colors.blueGrey[100]!,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: Get.height * 0.4,
                width: 500,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0, 1],
                    colors: [
                      Colors.orange[200]!,
                      Colors.orange,
                      // Colors.purple[100]!,
                      // Colors.purple[800]!,
                      // Colors.black,
                    ],
                  ),
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
