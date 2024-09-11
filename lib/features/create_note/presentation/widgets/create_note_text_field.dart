import 'package:flutter/material.dart';
import '../../data/models/text_field_model.dart';
import 'custom_text_field.dart';

class CreateNoteTextField extends StatelessWidget {
  const CreateNoteTextField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(textFieldModel.title,
        //     style: Styles.styleBold26.copyWith(color: const Color(0xff979797))),
        CustomTextField(
            textFieldModel: TextFieldModel(
              title: textFieldModel.title,
                maxLines: textFieldModel.maxLines,
                controller: textFieldModel.controller,
                validator: textFieldModel.validator)),
      ],
    );
  }
}
