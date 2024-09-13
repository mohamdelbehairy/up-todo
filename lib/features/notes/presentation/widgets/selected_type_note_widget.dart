import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/get_notes/get_notes_cubit.dart';
import '../manager/selected_type_note/selected_type_note_cubit.dart';
import 'selected_type_note_item.dart';

class SelectedTypeNoteWidget extends StatelessWidget {
  const SelectedTypeNoteWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var selectedTypeNote = context.watch<SelectedTypeNoteCubit>();

    return SizedBox(
      height: 100 + 16 + 16,
      child: GridView.builder(
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 50,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                selectedTypeNote.changeSelectedTypeNote(index);
                selectedTypeNote.listViewChangeIndex(-1);
                selectedTypeNote.gradeViewChangeIndex(-1);
                controller.clear();
                if (selectedTypeNote.selectedIndex == 1) {
                  context.read<GetNotesCubit>().getFavouriteNotes();
                }
                if (selectedTypeNote.selectedIndex == 2) {
                  context.read<GetNotesCubit>().getHiddenNotes();
                }
                if (selectedTypeNote.selectedIndex == 3) {
                  context.read<GetNotesCubit>().getTrashNotes();
                }
              },
              child: SelectedTypeNoteItem(
                  isActive: selectedTypeNote.selectedIndex == index,
                  selectedTypeNoteModel:
                      selectedTypeNote.selectedTypeNoteList[index]),
            );
          }),
    );
  }
}
