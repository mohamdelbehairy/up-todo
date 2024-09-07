import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/widgets/no_notes_found_widget.dart';

import '../../../../core/models/no_notes_found_model.dart';
import '../manager/get_events/get_events_cubit.dart';

class NoEventsFounded extends StatelessWidget {
  const NoEventsFounded({super.key});

  @override
  Widget build(BuildContext context) {
    var events = context.watch<GetEventsCubit>();
    return events.events.isEmpty
        ? NoNotesFoundWidget(
            noNotesFoundModel: NoNotesFoundModel(text: 'No events to display'))
        : const SizedBox.shrink();
  }
}
