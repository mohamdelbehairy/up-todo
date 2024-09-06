import 'package:flutter/material.dart';
import '../../../notes/presentation/widgets/notes_divider.dart';
import 'create_new_events_widget.dart';
import 'events_list_view.dart';
import 'events_table_calender.dart';
import 'events_view_header.dart';

class EventsViewBody extends StatelessWidget {
  const EventsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const EventsViewHeader(),
              const SizedBox(height: 24),
              const EventsTableCalender(),
              const SizedBox(height: 12),
              NotesDivider(color: Colors.grey.withOpacity(.45)),
              const SizedBox(height: 16),
              const CreateNewEventWidget(),
              const SizedBox(height: 16),
            ],
          ),
        ),
        const EventsListView()
      ],
    );
  }
}
