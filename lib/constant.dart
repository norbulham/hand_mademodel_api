import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


myStyle(double fs, [Color ?clr, FontWeight ?fw]){
  return GoogleFonts.nanumMyeongjo(
    fontSize: fs,
    color: clr,
    fontWeight: fw,
  );
}

Color primaryColor = Colors.blue.shade600;
Color secondaryColor = Colors.grey;
