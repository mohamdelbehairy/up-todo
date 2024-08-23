import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/features/onboarding/data/models/on_boardring_model.dart';
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
              child:
                  InkWell(child: Text('Skip', style: Styles.styleSemiBold14))),
        if (onBoardringModel.image != Assets.imagesOnBoardingOne)
          Positioned(
              left: 24.0,
              top: 58,
              child: InkWell(
                onTap: () {
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.arrow_back_ios,
                        color: AppColors.onBoardingButtonColor),
                    Text('Back', style: Styles.styleSemiBold14)
                  ],
                ),
              ))
      ],
    );
  }
}
