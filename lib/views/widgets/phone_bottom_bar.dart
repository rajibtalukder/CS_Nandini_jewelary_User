import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/widgets/nav_item.dart';
import '../home/screens/home_screen.dart';
import '../phone/screens/phone_screen.dart';
import '../whatsapp/screens/whatsapp_screen.dart';

Widget phoneBottomBar() {
  return Container(
    margin: REdgeInsets.symmetric(
      vertical: 10,
    ),
    height: 60.h,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // home
          NavItem(
            itemImage: "assets/images/live-rates.png",
            itemTitle: "Live Rates",
            isSelected: false,
            onTap: () {
              Get.offAll(HomeScreen());
            },
          ),
          // whatsapp
          NavItem(
            itemImage: "assets/images/wp.png",
            itemTitle: "Whatsapp",
            isSelected: false,
            onTap: () {
              Get.offAll(const WhatsappScreen());
            },
          ),
          // phone
          NavItem(
            itemImage: "assets/images/ph.png",
            itemTitle: "Phone",
            isSelected: true,
            onTap: () {
              Get.offAll(PhoneScreen());
            },
          ),
        ],
      ),
    ),
  );
}
