import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/features/onboarding/data/models/on_boardring_model.dart';

part 'on_boardring_state.dart';

class OnBoardringCubit extends Cubit<OnBoardringState> {
  OnBoardringCubit() : super(OnBoardringInitial());

  List<OnBoardringModel> onBoardringLiat = [
    OnBoardringModel(
        image: Assets.imagesOnBoardingOne,
        title: 'Manage your \nnotes easily',
        description:
            'A completely easy way to manage and customize your notes.',
        colorOne: AppColors.activeSmoothIndicatorColor,
        colorTwo: AppColors.inActiveSmoothIndicatorColor,
        colorThree: AppColors.inActiveSmoothIndicatorColor),
    OnBoardringModel(
        image: Assets.imagesOnBoardingTwo,
        title: 'Organize your \nthougts',
        description: 'Most beautiful note taking application.',
        colorOne: AppColors.inActiveSmoothIndicatorColor,
        colorTwo: AppColors.activeSmoothIndicatorColor,
        colorThree: AppColors.inActiveSmoothIndicatorColor),
    OnBoardringModel(
        image: Assets.imagesOnBoardingThree,
        title: 'Create cards and \neasy styling',
        description: 'Making your content legible has never been easier.',
        buttonName: 'Get Started',
        colorOne: AppColors.inActiveSmoothIndicatorColor,
        colorTwo: AppColors.inActiveSmoothIndicatorColor,
        colorThree: AppColors.activeSmoothIndicatorColor),
  ];
}
