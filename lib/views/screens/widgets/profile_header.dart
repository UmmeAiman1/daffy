import 'package:daffy/constants/app_colors.dart';
import 'package:daffy/constants/app_fonts.dart';
import 'package:daffy/constants/app_images.dart';
import 'package:daffy/constants/app_sizes.dart';
import 'package:daffy/controller/home_controller.dart';
import 'package:daffy/views/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({super.key});
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final user = controller.user.value;
    return Container(
      height: h(context, 127),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: all(context, 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    Assets.imagesPfp,
                    height: h(context, 85),
                    width: w(context, 85),
                  ),
                ),
              ],
            ),
            SizedBox(width: 8),
            Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text:
                      user?.name.replaceRange(
                        0,
                        1,
                        user.name[0].toUpperCase(),
                      ) ??
                      'N/A',
                  color: kWhite,
                  fontFamily: AppFonts.pjs700,
                  fontSize: 24,
                ),
                SizedBox(height: 8,),
                 CustomTextWidget(
                  text:
                     user?.designation?.toLowerCase() ?? 'N/A',
                  color: Color(0xCCFFFFFF),
                  fontFamily: AppFonts.inter,
                  fontSize: 14,
                ),
                CustomTextWidget(
              text: 'ID: ${user?.empId ?? 'N/A'}',
              color: Color(0x99FFFFFF),
              fontFamily: AppFonts.inter,
              fontSize: 12,
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
