import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:io' show Platform;

Future<dynamic> loadRequest(fn, [color]) async {
  dynamic val = await Get.showOverlay(
    asyncFunction: fn,
    loadingWidget: Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(),
    ),
    opacityColor: color ?? Colors.transparent,
  );
  return val;
}
