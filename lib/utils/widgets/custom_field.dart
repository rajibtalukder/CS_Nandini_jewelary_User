import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';

class CustomField extends StatelessWidget {
  final String fieldImage;
  final String hintText;

  const CustomField({
    Key? key,
    required this.fieldImage,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 0.50,
          color: const Color(0xFFB2BEC7),
        ),
      ),
      child: TextFormField(
        enabled: false,
        decoration: InputDecoration(
          contentPadding: REdgeInsets.symmetric(
            vertical: 14,
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: AppColors.primaryColor,
          ),
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: REdgeInsetsDirectional.only(start: 12.0,end: 10.0),
            child: Image.asset(
              fieldImage,
              width: 5.w,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
