import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';

Future<DateTime?> showDateSelect({lastDate, firstDate}) async {
  DateTime? dateSelect = await showRoundedDatePicker(
    height: 260,
    context: Get.context!,
    fontFamily: 'Kanit',
    era: EraMode.BUDDHIST_YEAR,
    lastDate: DateTime(2099),
    firstDate: firstDate ?? DateTime(1950),
    theme: ThemeData(
      primaryColor: Colors.orange,
      dialogBackgroundColor: Colors.white,
      // ignore: deprecated_member_use
      accentColor: Color(0xff00a1ba),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    styleDatePicker: MaterialRoundedDatePickerStyle(
      paddingMonthHeader: EdgeInsets.symmetric(
        vertical: 8,
      ),
      textStyleButtonNegative: TextStyle(
        fontFamily: 'Kanit',
        fontWeight: FontWeight.w500,
        // color: ThemeColor.primary,
      ),
      textStyleButtonPositive: TextStyle(
        fontFamily: 'Kanit',
        fontWeight: FontWeight.w500,
        // color: ThemeColor.primary,
      ),
    ),
  );
  return dateSelect;
}
