import 'package:intl/intl.dart';

String formattedData() {
  final now = DateTime.now();
  return DateFormat('dd MMMM, yyyy').format(now);
}
