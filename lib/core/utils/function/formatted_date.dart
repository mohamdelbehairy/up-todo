import 'package:intl/intl.dart';

String formattedData({DateTime? date}) {
  if (date != null) {
    final dateFormat = DateFormat('dd MMMM, yyyy');
    final timeFormat = DateFormat('HH:mm');
    return '${dateFormat.format(date)} At ${timeFormat.format(date)}';
  }
  return DateFormat('dd MMMM, yyyy').format(DateTime.now());
}
