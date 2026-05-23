import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_sizes.dart';
import '../../../controller/home_controller.dart';
import '../../widgets/custom_text_widget.dart';

class RouterCard extends StatelessWidget {
   RouterCard({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: 'SELECT ROUTE',
          color: kGrey,
          fontFamily: AppFonts.pjs600,
          fontSize: 12,
        ),
        SizedBox(height: h(context, 8)),
        Obx(() {
          final hasDistributor = controller.selectedDistributor.value != null;

          return GestureDetector(
            onTap:
                hasDistributor
                    ? () => _showRouteSheet(context)
                    : () => Get.snackbar(
                      'Select Distributor',
                      'Please select a distributor first',
                    ),
            child: Container(
              height: h(context, 60),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: hasDistributor ? kWhite : const Color(0xffF9F9F9),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xffE0E0E0), width: 1),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.route_outlined,
                    color: hasDistributor ? kSecondary : kGrey,
                    size: 22,
                  ),
                  SizedBox(width: h(context, 12)),
                  Expanded(
                    child: CustomTextWidget(
                      text:
                          controller.selectedRoute.value?.routeName ??
                          'Select Route',
                      color:
                          controller.selectedRoute.value != null
                              ? kSecondary
                              : kGrey,
                      fontFamily: AppFonts.pjs400,
                      fontSize: 14,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down_rounded, color: kGrey),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  void _showRouteSheet(BuildContext context) {
    Get.bottomSheet(
      
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
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
                text: 'Select Route',
                color: kSecondary,
                fontFamily: AppFonts.pjs700,
                fontSize: 18,
              ),
              const SizedBox(height: 16),
              Obx(() {
                if (controller.routes.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: CustomTextWidget(
                        text: 'No routes available',
                        color: kGrey,
                      ),
                    ),
                  );
                }
          
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.routes.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final route = controller.routes[index];
                    final isSelected =
                        controller.selectedRoute.value?.id == route.id;
          
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      leading: const Icon(
                        Icons.route_outlined,
                        color: Color(0xff2DD4BF),
                        size: 22,
                      ),
                      title: CustomTextWidget(
                        text: route.routeName ?? '',
                        color: kSecondary,
                        fontFamily: AppFonts.pjs400,
                        fontSize: 14,
                      ),
                      trailing:
                          isSelected
                              ? const Icon(
                                Icons.check_circle,
                                color: Color(0xff2DD4BF),
                              )
                              : null,
                      onTap: () {
                        controller.onRouteSelected(route);
                        Get.back();
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
