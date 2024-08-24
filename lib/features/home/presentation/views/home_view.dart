import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/bottom_navigation/bottom_navigation_cubit.dart';
import '../widgets/bottom_navigation_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomNavigation = context.read<BottomNavigationCubit>();
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: bottomNavigation.views[bottomNavigation.currentIndex] != 3
              ? bottomNavigation.views[bottomNavigation.currentIndex]
              : Container(),
          bottomNavigationBar: Theme(
              data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent),
              child: BottomNavigationBarWidget(
                  bottomNavigation: bottomNavigation)),
        );
      },
    );
  }
}
