import 'package:flutter/material.dart';

class NotesDivider extends StatelessWidget {
  const NotesDivider({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return  Divider(thickness: .5, color: color ?? Colors.grey);
  }
}
