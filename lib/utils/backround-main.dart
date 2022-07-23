import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

class BackGroundMain extends StatelessWidget {
  final Widget child;
  final double? height;
  BackGroundMain({required this.child, this.height});

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
              clipper: CurveClip(),
              child: Container(
                height: height == null ? (Get.height * 0.4) + 10 : height! + 10,
                width: double.infinity,
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
              clipper: CurveClip(),
              child: Container(
                height: height ?? (Get.height * 0.4),
                width: double.infinity,
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
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}

class CurveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      (size.height / 2) + 70,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
