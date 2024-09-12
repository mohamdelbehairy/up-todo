import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:up_todo/core/utils/app_router.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/features/onboarding/data/models/on_boardring_model.dart';
import '../../../../core/widgets/custom_back_widget.dart';
import 'on_boardring_image.dart';
import 'on_boardring_indicator_and_text_and_button.dart';

class OnBoardringItem extends StatelessWidget {
  const OnBoardringItem(
      {super.key,
      required this.onBoardringModel,
      required this.pageController});
  final OnBoardringModel onBoardringModel;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: OnBoardringImage(image: onBoardringModel.image)),
            Expanded(
                child: OnBoardringIndicatorAndTextAndButton(
                    onBoardringModel: onBoardringModel,
                    pageController: pageController))
          ],
        ),
        if (onBoardringModel.image != Assets.imagesOnBoardingThree)
          Positioned(
              right: 24.0,
              top: 60,
              child: InkWell(
                  onTap: () async {
                    GoRouter.of(context).go(AppRouter.homeView);
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString(Constants.kOnBoarding, 'true');
                  },
                  child: Text('Skip', style: Styles.styleSemiBold14))),
        if (onBoardringModel.image != Assets.imagesOnBoardingOne)
          Positioned(
              left: 24.0,
              top: 58,
              child: CustomBackWidget(
                  onTap: () => pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn)))
      ],
    );
  }
}
