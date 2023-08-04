import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee_text/marquee_text.dart';

import '../../../utils/colors.dart';

Widget RunningText(String text) {
  return Container(
    padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      color: const Color(0xffFFFBEA).withOpacity(0.2),
    ),
    child: MarqueeText(
      speed: 15,
      text: TextSpan(
        text: text,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
      ),
    ),
  );
}
