import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTextStyle({color, size, fontWeight}) {
  return GoogleFonts.kanit(
    color: color,
    fontSize: size.toDouble(),
    fontWeight: fontWeight,
  );
}
