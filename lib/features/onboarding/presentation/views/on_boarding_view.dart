import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/on_boardring/on_boardring_cubit.dart';
import '../widgets/on_boardring_item.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          controller: _pageController,
          onPageChanged: (value) {},
          children: List.generate(3, (index) {
            return OnBoardringItem(
              pageController: _pageController,
                onBoardringModel:
                    context.read<OnBoardringCubit>().onBoardringLiat[index]);
          }),
        ));
  }
}
