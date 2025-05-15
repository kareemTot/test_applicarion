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

final class OnlinePaymentSuccessState extends CartState {
  final String sessionId;
  const OnlinePaymentSuccessState({required this.sessionId});
}

final class OnlinePaymentFailureState extends CartState {
  final String message;
  const OnlinePaymentFailureState({required this.message});
}

final class CreateOrderLoadingState extends CartState {}

final class CreateOrderSuccesState extends CartState {
  final CreateOrderModel createOrderModel;
  const CreateOrderSuccesState({required this.createOrderModel});
}

final class CreateOrderFailureState extends CartState {
  final String message;
  const CreateOrderFailureState({required this.message});
}

final class UpdateOrderPaymentSuccessState extends CartState {
  const UpdateOrderPaymentSuccessState();
}

final class UpdateOrderPaymentFailureState extends CartState {
  final String message;
  const UpdateOrderPaymentFailureState({required this.message});
}
