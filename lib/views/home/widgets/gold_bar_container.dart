
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

Widget GoldBarContainer(
    String barName,
    String barUnit,
    String barPrice,
    ) {
  return Container(
    padding: REdgeInsets.symmetric(
      vertical: 15,
    ),
    decoration: BoxDecoration(
      color: AppColors.greyColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(8),
    ),
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            barName,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
          const VerticalDivider(),
          Text(
            barUnit,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
          const VerticalDivider(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: barPrice,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                TextSpan(
                  text: "TK",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
