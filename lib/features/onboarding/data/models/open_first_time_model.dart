import 'package:hive/hive.dart';

part 'open_first_time_model.g.dart';

@HiveType(typeId: 1)
class OpenFirstTimeModel {
  @HiveField(0)
  final bool isOpen;

  OpenFirstTimeModel({this.isOpen = false});
}
