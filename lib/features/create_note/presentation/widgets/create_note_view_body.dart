import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/create_note/data/models/text_field_model.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/presentation/manager/get_notes/get_notes_cubit.dart';
import 'package:up_todo/features/notes/presentation/manager/store_note/store_note_cubit.dart';
import 'package:uuid/uuid.dart';
import 'create_note_app_bar.dart';
import 'create_note_text_field.dart';

class CreateNoteViewBody extends StatefulWidget {
  const CreateNoteViewBody({super.key});

  @override
  State<CreateNoteViewBody> createState() => _CreateNoteViewBodyState();
}

class _CreateNoteViewBodyState extends State<CreateNoteViewBody> {
  late TextEditingController title, body;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    title = TextEditingController();
    body = TextEditingController();
    title.addListener(() {
      setState(() {});
    });
    body.addListener(() {
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
    return BlocListener<StoreNoteCubit, StoreNoteState>(
      listener: (context, state) {
        if (state is StoreNoteSuccess) {
          context.read<GetNotesCubit>().getAllNotes();
          GoRouter.of(context).pop(context);
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            CreateNoteAppBar(onTap: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                await context.read<StoreNoteCubit>().storeNote(
                    noteModel: NoteModel(
                        id: const Uuid().v4(),
                        title: title.text,
                        body: body.text),
                    boxName: Constants.kAllNotes);
              }
            }),
            const SizedBox(height: 24),
            CreateNoteTextField(
                textFieldModel: TextFieldModel(
                    title: 'Page Title',
                    controller: title,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a title';
                      } else if (value.length < 5) {
                        return 'Title must be at least 5 characters long';
                      } else if (value.length > 20) {
                        return 'Title must be at most 15 characters long';
                      }
                      return null;
                    })),
            const SizedBox(height: 16),
            if (body.text.isNotEmpty ||
                (title.text.isNotEmpty && title.text.length >= 5))
              CreateNoteTextField(
                  textFieldModel: TextFieldModel(
                      title: 'Page Body',
                      maxLines: body.text.length > 30 ? 4 : 2,
                      controller: body,
                      validator: (value) {
                        if (value!.length < 15 && title.text.length < 20) {
                          return 'Body must be at least 15 characters long';
                        }
                        return null;
                      })),
          ],
        ),
      ),
    );
  }
}
