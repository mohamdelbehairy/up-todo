import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/styles.dart';

class NoRecentSearchesWidget extends StatelessWidget {
  const NoRecentSearchesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 346,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text('No recent searches to display',
              style: Styles.styleItalic17),
        ),
      ),
    );
  }
}
