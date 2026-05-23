import 'package:daffy/constants/app_colors.dart';
import 'package:daffy/constants/app_fonts.dart';
import 'package:daffy/constants/app_images.dart';
import 'package:daffy/constants/app_sizes.dart';
import 'package:daffy/controller/login_controller.dart';
import 'package:daffy/views/screens/widgets/profile_header.dart';
import 'package:daffy/views/widgets/custom_card_widget.dart';
import 'package:daffy/views/widgets/custom_text_widget.dart';
import 'package:daffy/views/widgets/section_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final HomeController controller = Get.find<HomeController>();
  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final user = controller.user.value;
    return Scaffold(
      backgroundColor: kOffwhite,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _loginController.logout();
            },
            icon: Icon(Icons.logout_outlined, color: kSecondary),
          ),
        ],
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 0.2,
        backgroundColor: kWhite,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: 'My Profile',
              color: kSecondary,
              fontSize: 18,
              fontFamily: AppFonts.pjs700,
            ),
            CustomTextWidget(
              text: 'View Your Account Details',
              color: kGrey,
              fontSize: 13,
              fontFamily: AppFonts.pjs400,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ProfileHeader(),
          SizedBox(height: h(context, 24)),

          SectionCard(
            title: 'APP & COMPANY',
            color: kGrey,
            fontFamily: AppFonts.inter700,
          ),
          SizedBox(height: h(context, 12)),
          Row(
            children: [
              Expanded(
                child: CustomCardWidget(
                  title: 'Company Name',
                  image: Assets.imagesCompany,
                  height: h(context, 76),
                  textColor: kGrey,
                  subtitle: user?.companyName ?? 'N/A',
                  subtitleColor: kSecondary,
                ),
              ),
              SizedBox(width: w(context, 8)),
              Expanded(
                child: CustomCardWidget(
                  title: 'App Version',
                  image: Assets.imagesCNIC,
                  height: h(context, 76),
                  textColor: kGrey,
                  subtitle: '1.0.0',
                  subtitleColor: kSecondary,
                ),
              ),
            ],
          ),

          SizedBox(height: h(context, 24)),

          SectionCard(
            title: 'WORK INFORMATION',
            color: kGrey,
            fontFamily: AppFonts.inter700,
          ),
          SizedBox(height: h(context, 12)),
          CustomCardWidget(
            title: 'Employee ID',
            image: Assets.imagesEmpId,
            height: h(context, 76),
            textColor: kGrey,
            subtitle: user?.empId ?? 'N/A',
            subtitleColor: kSecondary,
          ),
          SizedBox(height: h(context, 8)),
          CustomCardWidget(
            title: 'Department Name',
            image: Assets.imagesCompany,
            height: h(context, 76),
            textColor: kGrey,
            subtitle: user?.department ?? 'N/A',
            subtitleColor: kSecondary,
          ),
          SizedBox(height: h(context, 8)),
          CustomCardWidget(
            title: 'Date Of Joining',
            image: Assets.imagesCalender,
            height: h(context, 76),
            textColor: kGrey,
            subtitle: user?.dateOfJoin ?? 'N/A',
            subtitleColor: kSecondary,
          ),

          SizedBox(height: h(context, 24)),

          SectionCard(
            title: 'CONTACT INFORMATION',
            color: kGrey,
            fontFamily: AppFonts.inter700,
          ),
          SizedBox(height: h(context, 12)),
          CustomCardWidget(
            title: 'Phone Number',
            image: Assets.imagesPhone,
            height: h(context, 76),
            textColor: kGrey,
            subtitle: user?.phone ?? 'N/A',
            subtitleColor: kSecondary,
          ),
          SizedBox(height: h(context, 8)),
          CustomCardWidget(
            title: 'Email Address',
            image: Assets.imagesEmail,
            height: h(context, 76),
            textColor: kGrey,
            subtitle: user?.email ?? 'N/A',
            subtitleColor: kSecondary,
          ),
          SizedBox(height: h(context, 8)),
          CustomCardWidget(
            title: 'CNIC',
            image: Assets.imagesCNIC,
            height: h(context, 76),
            textColor: kGrey,
            subtitle: user?.cnic ?? 'N/A',
            subtitleColor: kSecondary,
          ),

          SizedBox(height: h(context, 24)),
          SectionCard(
            title: 'LOCATION INFORMATION',
            color: kGrey,
            fontFamily: AppFonts.inter700,
          ),
          SizedBox(height: h(context, 12)),
          CustomCardWidget(
            title: 'Address',
            image: Assets.imagesCompany,
            height: h(context, 76),
            textColor: kGrey,
            subtitle: user?.address ?? 'N/A',
            subtitleColor: kSecondary,
          ),
          SizedBox(height: h(context, 8)),
          Row(
            children: [
              Expanded(
                child: CustomCardWidget(
                  title: 'City',
                  image: Assets.imagesCompany,
                  height: h(context, 76),
                  textColor: kGrey,
                  subtitle: user?.city ?? 'N/A',
                  subtitleColor: kSecondary,
                ),
              ),
              SizedBox(width: w(context, 8)),
              Expanded(
                child: CustomCardWidget(
                  title: 'State',
                  image: Assets.imagesCompany,
                  height: h(context, 76),
                  textColor: kGrey,
                  subtitle: user?.state ?? 'N/A',
                  subtitleColor: kSecondary,
                ),
              ),
            ],
          ),

          SizedBox(height: h(context, 24)),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.person_outline, color: kGrey, size: 20),
                SizedBox(width: w(context, 12)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: 'Profile Information',
                        color: kSecondary,
                        fontSize: 14,
                        fontFamily: AppFonts.pjs600,
                      ),
                      SizedBox(height: h(context, 4)),
                      CustomTextWidget(
                        text:
                            'Your profile details are managed by your administrator. Please contact your manager if you need to update any information.',
                        color: kGrey,
                        fontSize: 12,
                        fontFamily: AppFonts.pjs400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
