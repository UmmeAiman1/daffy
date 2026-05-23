import 'package:daffy/constants/app_colors.dart';
import 'package:daffy/constants/app_fonts.dart';
import 'package:daffy/constants/app_images.dart';
import 'package:daffy/constants/app_sizes.dart';
import 'package:daffy/controller/home_controller.dart';
import 'package:daffy/views/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DistributorCard extends StatelessWidget {
  DistributorCard({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: 'SELECT DISTRIBUTOR',
          color: kGrey,
          fontFamily: AppFonts.pjs600,
          fontSize: 12,
        ),
        SizedBox(height: h(context, 8)),
        Obx(() {
          return GestureDetector(
            onTap: () => _showDistributorSheet(context),
            child: Container(
              height: h(context, 60),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xffE0E0E0),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Image.asset(Assets.imagesCompany, height: 24, width: 24),
                  SizedBox(width: h(context, 12)),
                  Expanded(
                    child: CustomTextWidget(
                      text: controller.selectedDistributor.value
                              ?.distributorName ??
                          'Select Distributor',
                      color: controller.selectedDistributor.value != null
                          ? kSecondary
                          : kGrey,
                      fontFamily: AppFonts.pjs400,
                      fontSize: 14,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: kGrey,
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  void _showDistributorSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xffE0E0E0),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextWidget(
              text: 'Select Distributor',
              color: kSecondary,
              fontFamily: AppFonts.pjs700,
              fontSize: 18,
            ),
            const SizedBox(height: 16),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.distributors.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final dist = controller.distributors[index];
                  final isSelected =
                      controller.selectedDistributor.value?.id == dist.id;

                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    leading: Image.asset(
                      Assets.imagesCompany,
                      height: 24,
                      width: 24,
                    ),
                    title: CustomTextWidget(
                      text: dist.distributorName ?? '',
                      color: kSecondary,
                      fontFamily: AppFonts.pjs400,
                      fontSize: 14,
                    ),
                    trailing: isSelected
                        ? const Icon(
                            Icons.check_circle,
                            color: Color(0xff2DD4BF),
                          )
                        : null,
                    onTap: () {
                      controller.onDistributorSelected(dist);
                      Get.back(); // bottom sheet close
                    },
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}