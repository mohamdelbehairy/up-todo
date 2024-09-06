import 'package:flutter/material.dart';
import 'package:up_todo/core/widgets/build_view.dart';
import 'package:up_todo/features/events/presentation/widgets/events_view_body.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BuildView(child: EventsViewBody());
  }
}