import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../events/presentation/manager/get_events/get_events_cubit.dart';
import '../../../events/presentation/widgets/events_item.dart';
import '../../../notes/data/models/note_item_model.dart';

class ShowSearchResult extends StatelessWidget {
  const ShowSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    var events = context.read<GetEventsCubit>();
    return BlocBuilder<GetEventsCubit, GetEventsState>(
      builder: (context, state) {
        if (events.displayEvents.isNotEmpty) {
          return Expanded(
              child: ListView.builder(
                  itemCount: events.displayEvents.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: EventsItem(
                          noteItemModel: NoteItemModel(
                            note: events.events[index],
                            onTap: () {
                              events.listViewChangeIndex(index);
                            },
                            onLongTap: () {},
                            isActive: events.acvtiveIndex == index,
                          ),
                        ));
                  }));
        }
        return const SizedBox();
      },
    );
  }
}
