import 'package:flutter/material.dart';
import '../widgets/create_note_view_body.dart';

class CreateNoteView extends StatelessWidget {
  const CreateNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF2F2F6),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: CreateNoteViewBody(),
        ),
      ),
    );
  }
}
