import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/utils/app_router.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/features/search/presentation/manager/search/search_cubit.dart';

import '../../../events/presentation/manager/get_events/get_events_cubit.dart';
import '../manager/bottom_navigation/bottom_navigation_cubit.dart';
import 'custom_navigation_bar_item.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key, required this.bottomNavigation});
  final BottomNavigationCubit bottomNavigation;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            height: 1,
            color: Colors.grey.shade300,
            width: MediaQuery.of(context).size.width),
        BottomNavigationBar(
          currentIndex: bottomNavigation.currentIndex,
          selectedItemColor: AppColors.secondaryColor,
          unselectedItemColor: AppColors.primaryColor,
          selectedLabelStyle:
              Styles.styleSemiBold9.copyWith(color: AppColors.secondaryColor),
          unselectedLabelStyle: Styles.styleSemiBold9,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) {
            if (index == 3) {
              GoRouter.of(context).push(AppRouter.createNoteView);
            } else {
              bottomNavigation.changeIndex(index);
              context.read<GetEventsCubit>().listViewChangeIndex(-1);
              context.read<SearchCubit>().displayAllNotes.clear();
            }
          },
          items: List.generate(bottomNavigation.bottomNavigationList.length,
              (index) {
            return customNavigationBarItem(
                activeIndex: bottomNavigation.currentIndex == index,
                bottomNavigationModel:
                    bottomNavigation.bottomNavigationList[index]);
          }),
        ),
      ],
    );
  }
}
