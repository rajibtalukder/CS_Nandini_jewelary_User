import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nondini_jewellery_user/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nondini_jewellery_user/views/home/widgets/gold_bar_container.dart';
import 'package:nondini_jewellery_user/views/widgets/home_bottom_bar.dart';
import '../../../controller/home_controller.dart';
import '../widgets/running_text.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
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
                /*SingleChildScrollView(
                  child: Column(
                    children: [
                      const RSizedBox(height: 30),
                      Container(
                        padding: REdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Text(
                            "LIVE RATES",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.16,
                              color: Colors.white,
                            ),
                          ),
                          trailing: Text(
                            "PRODUCTS",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const RSizedBox(height: 50),
                      // goldBar container
                      const GoldBarContainer(
                        barName: "TT Bar Today",
                        barUnit: "PER BHORI",
                        barPrice: "263638",
                      ),
                      const RSizedBox(height: 20),

                      const RSizedBox(height: 20),
                      const RunningText(),
                      const RSizedBox(height: 150),
                    ],
                  ),
                ),*/
                FutureBuilder<dynamic>(
                    future: homeController.getProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          child: Obx(
                                () => Column(
                              children: [
                                const RSizedBox(height: 20),
                                Container(
                                  padding: REdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ListTile(
                                    leading: Text(
                                      "LIVE RATES",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    trailing: Text(
                                      "PRODUCTS",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const RSizedBox(height: 20),
                                // goldBar container
                                for (int i = 0;
                                i <
                                    homeController
                                        .productsDataModel.value.data!.length;
                                i++)
                                  if(homeController.productsDataModel.value.data?[i].status==1)
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GoldBarContainer(
                                          homeController.productsDataModel.value
                                              .data?[i].productName ??
                                              "",
                                          homeController.productsDataModel.value
                                              .data?[i].productQuantity ??
                                              "",
                                          homeController.productsDataModel.value
                                              .data?[i].productPrice ??
                                              ""),
                                      const RSizedBox(height: 10),

                                    ],
                                  ),
                                const RSizedBox(height: 20),
                                 RunningText(homeController.infoModel.value.data!.first.message),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                              color: AppColors.primaryColor),
                        );
                      }
                    }),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: homeBottomBar()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
