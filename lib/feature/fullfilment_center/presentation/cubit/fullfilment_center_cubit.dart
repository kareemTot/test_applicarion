import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_applicarion/feature/fullfilment_center/domain/repo/fullfilment_center_repo.dart';

import '../../data/model/fullfilment_centers_model/fullfilment_center_model.dart';
part 'fullfilment_center_state.dart';

class FullfilmentCenterCubit extends Cubit<FullfilmentCenterState> {
  final FullfilmentCenterRepo _repo;
  FullfilmentCenterCubit(this._repo) : super(FullfilmentCenterInitial());

  FullfilmentCenterModel? fullfilmentCenterModel;
  int currentIndex = 0;

  Future<void> getFullfilmentCenter() async {
    emit(FullfilmentCenterLoadingState());
    final result = await _repo.getFullfilmentCenter();

    result.fold((l) => emit(FullfilmentCenterFailureState(l.message)), (r) {
      fullfilmentCenterModel = r;
      log("fullfilmentCenterModel:$fullfilmentCenterModel");
      emit(FullfilmentCenterSuccessState(r));
    });
  }

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndex(index));
  }
}
