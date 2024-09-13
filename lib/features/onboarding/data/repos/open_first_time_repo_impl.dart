import 'package:hive/hive.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/onboarding/data/models/open_first_time_model.dart';

import 'open_first_time_repo.dart';

class OpenFirstTimeRepoImpl extends OpenFirstTimeRepo {
  @override
  Future<void> storeOpenFirstTime() async {
    var box = Hive.box<OpenFirstTimeModel>(Constants.kOpenFirstTime);
    await box.add(OpenFirstTimeModel(isOpen: true));
  }

  @override
  Future<bool> checkOpenFirstTime() async {
    var box = Hive.box<OpenFirstTimeModel>(Constants.kOpenFirstTime);
    return box.values.isNotEmpty;
  }
}
