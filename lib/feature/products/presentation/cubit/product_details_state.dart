part of 'product_details_cubit.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsSuccessState extends ProductDetailsState {
  final ProductDetailsModel productDetailsModel;
  const ProductDetailsSuccessState(this.productDetailsModel);
  @override
  List<Object> get props => [productDetailsModel];
}

final class ProductDetailsFailureState extends ProductDetailsState {
  final String failure;
  const ProductDetailsFailureState(this.failure);
}

final class ChangeSelectedVariation extends ProductDetailsState {
  final int index;
  const ChangeSelectedVariation(this.index);
  @override
  List<Object> get props => [index];
}

final class RemoveSelectedVariation extends ProductDetailsState {
  const RemoveSelectedVariation();
  @override
  List<Object> get props => [];
}
