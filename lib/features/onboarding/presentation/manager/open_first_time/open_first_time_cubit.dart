import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/open_first_time_repo.dart';

part 'open_first_time_state.dart';

class OpenFirstTimeCubit extends Cubit<OpenFirstTimeState> {
  OpenFirstTimeCubit(this._openFirstTimeRepo) : super(OpenFirstTimeInitial());

  final OpenFirstTimeRepo _openFirstTimeRepo;

  Future<void> storeOpenFirstTime() async {
    await _openFirstTimeRepo.storeOpenFirstTime();
    emit(StoreOpenFirstTimeSuccess());
  }

  Future<bool> checkOpenFirstTime() async {
    return await _openFirstTimeRepo.checkOpenFirstTime();
  }
}
