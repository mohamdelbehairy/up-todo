import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/models/note_item_model.dart';

import '../../../../core/utils/function/show_custom_events_dialog.dart';
import '../manager/get_events/get_events_cubit.dart';
import 'events_item.dart';

class EventsListView extends StatelessWidget {
  const EventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    var events = context.read<GetEventsCubit>();
    return BlocBuilder<GetEventsCubit, GetEventsState>(
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(childCount: events.events.length,
              (context, index) {
            return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: EventsItem(
                  noteItemModel: NoteItemModel(
                    note: events.events[index],
                    onTap: () {
                      events.listViewChangeIndex(index);
                    },
                    onLongTap: () {
                      showCustomEventsDialog(context,
                          index: index, id: events.events[index].id!);
                    },
                    isActive: events.acvtiveIndex == index,
                  ),
                ));
          }),
        );
      },
    );
  }
}
