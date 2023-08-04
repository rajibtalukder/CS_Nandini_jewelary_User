import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nondini_jewellery_user/views/home/screens/home_screen.dart';
import 'package:nondini_jewellery_user/views/phone/screens/phone_screen.dart';
import 'package:nondini_jewellery_user/views/whatsapp/screens/whatsapp_screen.dart';
import 'nav_item.dart';
import '../colors.dart';

class PhoneBottomBar extends StatelessWidget {
  const PhoneBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 20.0).copyWith(
            bottom: 20,
          ),
          child: Container(
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // home
                NavItem(
                  itemImage: "assets/images/live-rates.png",
                  itemTitle: "Live Rates",
                  isSelected: false,
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                        (route) => false);
                  },
                ),
                // whatsapp
                NavItem(
                  itemImage: "assets/images/wp.png",
                  itemTitle: "Whatsapp",
                  isSelected: false,
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WhatsappScreen(),
                        ),
                        (route) => false);
                  },
                ),
                // phone
                NavItem(
                  itemImage: "assets/images/ph.png",
                  itemTitle: "Phone",
                  isSelected: true,
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhoneScreen(),
                        ),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
