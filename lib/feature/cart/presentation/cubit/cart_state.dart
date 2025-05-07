part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class UpdateOrderDynamicPropertiesLoadingState extends CartState {}

final class UpdateOrderDynamicPropertiesSuccessState extends CartState {}

final class UpdateOrderDynamicPropertiesErrorState extends CartState {
  final String message;
  const UpdateOrderDynamicPropertiesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

final class GetCartLoadingState extends CartState {}

final class GetCartSuccessState extends CartState {
  final CartModel cartModel;
  const GetCartSuccessState({required this.cartModel});
}

final class GetCartFailureState extends CartState {
  final String message;
  const GetCartFailureState({required this.message});
}
