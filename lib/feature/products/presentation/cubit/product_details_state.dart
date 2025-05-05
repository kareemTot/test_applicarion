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
}

final class ProductDetailsFailureState extends ProductDetailsState {
  final String failure;
  const ProductDetailsFailureState(this.failure);
}
