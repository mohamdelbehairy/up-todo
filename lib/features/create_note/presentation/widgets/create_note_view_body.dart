import 'package:flutter/material.dart';
import 'package:up_todo/features/create_note/data/models/text_field_model.dart';
import 'create_note_app_bar.dart';
import 'create_note_text_field.dart';

class CreateNoteViewBody extends StatefulWidget {
  const CreateNoteViewBody({super.key});

  @override
  State<CreateNoteViewBody> createState() => _CreateNoteViewBodyState();
}

class _CreateNoteViewBodyState extends State<CreateNoteViewBody> {
  late TextEditingController title, body;

  @override
  void initState() {
    title = TextEditingController();
    body = TextEditingController();
    title.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        CreateNoteAppBar(onTap: () {}),
        const SizedBox(height: 24),
        CreateNoteTextFieldField(
            textFieldModel:
                TextFieldModel(title: 'Page Title', controller: title)),
        const SizedBox(height: 16),
        if (title.text.isNotEmpty && title.text.length >= 5)
          CreateNoteTextFieldField(
              textFieldModel: TextFieldModel(
                  title: 'Page Body', maxLines: 10, controller: body)),
      ],
    );
  }
}
