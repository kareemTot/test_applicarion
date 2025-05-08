part of 'fullfilment_center_cubit.dart';

sealed class FullfilmentCenterState extends Equatable {
  const FullfilmentCenterState();

  @override
  List<Object> get props => [];
}

final class FullfilmentCenterInitial extends FullfilmentCenterState {}

final class FullfilmentCenterLoadingState extends FullfilmentCenterState {}

final class FullfilmentCenterSuccessState extends FullfilmentCenterState {
  final FullfilmentCenterModel fullFilmentCenterModel;
  const FullfilmentCenterSuccessState(this.fullFilmentCenterModel);

  @override
  List<Object> get props => [fullFilmentCenterModel];
}

final class FullfilmentCenterFailureState extends FullfilmentCenterState {
  final String failure;
  const FullfilmentCenterFailureState(this.failure);

  @override
  List<Object> get props => [failure];
}

final class ChangeCurrentIndex extends FullfilmentCenterState {
  final int index;
  const ChangeCurrentIndex(this.index);
  @override
  List<Object> get props => [index];
}
