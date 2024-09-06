import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/styles.dart';

import '../manager/selected_type_note/selected_type_note_cubit.dart';

class ShowNotesHeader extends StatelessWidget {
  const ShowNotesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedIndex = context.watch<SelectedTypeNoteCubit>();
    if (selectedIndex.selectedIndex == -1 || selectedIndex.selectedIndex == 0) {
      return Text('Recent Notes', style: Styles.styleBold15);
    } else if (selectedIndex.selectedIndex == 1) {
      return Text('Favourites', style: Styles.styleBold15);
    } else if (selectedIndex.selectedIndex == 2) {
      return Text('Hidden', style: Styles.styleBold15);
    } else {
      return Text('Trash', style: Styles.styleBold15);
    }
  }
}
