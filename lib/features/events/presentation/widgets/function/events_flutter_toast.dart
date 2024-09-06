  import 'package:up_todo/core/utils/colors.dart';

import '../../../../../core/models/flutter_toast_model.dart';
import '../../../../../core/widgets/custom_flutter_toast.dart';

void eventsFlutterToast(String message) {
    CustomFlutterToast.showCustomFlutterToast(
        flutterToastModel: FlutterToastModel(
            backgroundColor: AppColors.hiddenNotesColor, message: message));
  }