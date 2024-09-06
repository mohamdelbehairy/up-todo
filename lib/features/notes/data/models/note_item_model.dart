import 'note_model.dart';

class NoteItemModel {
  final double? width;
  final NoteModel note;
  final Function() onTap,onLongTap;
  final bool isActive;

  NoteItemModel(
      {this.width,
      required this.note,
      required this.onTap,
      required this.onLongTap,
      this.isActive = false});
}
