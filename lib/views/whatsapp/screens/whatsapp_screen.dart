import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nondini_jewellery_user/controller/home_controller.dart';
import 'package:nondini_jewellery_user/utils/widgets/custom_button.dart';
import 'package:nondini_jewellery_user/utils/widgets/custom_field.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/whatsapp_bottom_bar.dart';

class WhatsappScreen extends StatefulWidget {
  const WhatsappScreen({Key? key}) : super(key: key);

  @override
  State<WhatsappScreen> createState() => _WhatsappScreenState();
}

class _WhatsappScreenState extends State<WhatsappScreen> {
  int currentIndex = 1;
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    String phoneNumber = homeController.infoModel.value.data!.first.whatsapp;
    String whatsappNumber = "https://wa.me/88$phoneNumber";

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
                        "WhatsApp Number",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const RSizedBox(height: 10),
                      // whatsapp field
                      CustomField(
                        hintText: homeController
                                .infoModel.value.data?.first.whatsapp ??
                            'Data not found',
                        fieldImage: "assets/images/wp.png",
                      ),
                      const RSizedBox(height: 40),
                      // update whatsapp number
                      CustomButton(
                        onClick: () async {
                          await canLaunch(whatsappNumber)
                              ? await launch(whatsappNumber)
                              : throw "could not launch";
                        },
                        btnText: "Send Message",
                      ),
                      const RSizedBox(height: 300),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: whatsappBottomBar()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
