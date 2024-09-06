import 'package:flutter/material.dart';
import '../../../../core/widgets/build_view.dart';
import '../widgets/create_note_view_body.dart';

class CreateNoteView extends StatelessWidget {
  const CreateNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BuildView(child: CreateNoteViewBody());
  }
}
