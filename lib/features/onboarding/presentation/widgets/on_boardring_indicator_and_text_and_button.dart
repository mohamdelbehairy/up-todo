import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/core/utils/styles.dart';

import '../../../../core/utils/app_router.dart';
import '../../data/models/on_boardring_model.dart';
import 'custom_smooth_indicator.dart';

class OnBoardringIndicatorAndTextAndButton extends StatelessWidget {
  const OnBoardringIndicatorAndTextAndButton(
      {super.key,
      required this.onBoardringModel,
      required this.pageController});

  final OnBoardringModel onBoardringModel;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.onBoardingBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 42),
            CustomSmoothIndicator(onBoardringModel: onBoardringModel),
            const SizedBox(height: 64),
            Text(onBoardringModel.title,
                textAlign: TextAlign.center, style: Styles.styleBold32),
            const SizedBox(height: 32),
            Text(onBoardringModel.description,
                textAlign: TextAlign.center, style: Styles.styleRegular14),
            const Spacer(),
            InkWell(
              onTap: () async {
                if (pageController.page?.toInt() == 2) {
                  GoRouter.of(context).go(AppRouter.homeView);
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString(Constants.kOnBoarding, 'true');
                } else {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                }
              },
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                    child: Text(onBoardringModel.buttonName,
                        style: Styles.styleBold17)),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
