import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nondini_jewellery_user/utils/widgets/phone_bottombar.dart';
import 'package:nondini_jewellery_user/views/widgets/phone_bottom_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_field.dart';
import 'package:get/get.dart';

class PhoneScreen extends StatelessWidget {
   PhoneScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final Uri phoneNumber = Uri.parse('tel:+88${homeController.infoModel.value.data?.first.phone}');
    return Scaffold(
      body: Container(
        width: 360.w,
        height: 690.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: REdgeInsets.symmetric(
              horizontal: 10,
              vertical: 16,
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RSizedBox(height: 50),
                      Text(
                        "Phone Number",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const RSizedBox(height: 10),
                      // whatsapp field
                       CustomField(
                        hintText: homeController.infoModel.value.data?.first.phone??'Data not found',
                        fieldImage: "assets/images/ph.png",
                      ),
                      const RSizedBox(height: 40),
                      // update whatsapp number
                      CustomButton(
                        onClick: () async{
                          launchUrl(phoneNumber);
                        },
                        btnText: "Call Us Now",
                      ),
                      const RSizedBox(height: 300),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: phoneBottomBar(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
