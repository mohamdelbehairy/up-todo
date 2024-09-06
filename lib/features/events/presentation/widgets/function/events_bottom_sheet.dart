  import 'package:flutter/material.dart';

import '../events_bottom_sheet_body.dart';

Future<dynamic> eventsBottomSheet(BuildContext context) {
    return showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: const Color(0xffEDEDF1),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16))),
          builder: (context) => const EventsBottomSheetBody());
  }