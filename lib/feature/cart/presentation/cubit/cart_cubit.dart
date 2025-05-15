import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_applicarion/feature/cart/domain/repo/cart_repo.dart';
import '../../Data/Model/carts_model/cart_model.dart';
import '../../Data/Model/create_order_model/create_order_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit(this.cartRepo) : super(CartInitial());

  CartModel? cartModel;
  String? sessionId;

  //! Create Order From Cart
  Future<void> createOrderFromCart({required String cartId}) async {
    emit(CreateOrderLoadingState());
    final result = await cartRepo.createOrderFromCart(cartId: cartId);
    result.fold((l) => emit(CreateOrderFailureState(message: l.message)), (
      r,
    ) async {
      log("Order ID:${r.id}");
      emit(CreateOrderSuccesState(createOrderModel: r));
      Future.wait([
        updateOrderDynamicProperties(orderId: r.id!),
        onlinePayment(orderId: r.id!),
        updateOrderPayemnt(amount: r.total!.amount!, orderId: r.id!),
      ]);
    });
  }

  //! Update Order Dynamic Properties
  Future<void> updateOrderDynamicProperties({required String orderId}) async {
    emit(UpdateOrderDynamicPropertiesLoadingState());
    final result = await cartRepo.updateOrderDynamicProperties(
      orderId: orderId,
    );
    result.fold(
      (l) => emit(UpdateOrderDynamicPropertiesErrorState(message: l.message)),
      (r) {
        emit(UpdateOrderDynamicPropertiesSuccessState());
      },
    );
  }

  //! Get Cart Info
  Future<void> getCartInfo() async {
    emit(GetCartLoadingState());
    final result = await cartRepo.cartInfo();
    result.fold((l) => emit(GetCartFailureState(message: l.message)), (r) {
      cartModel = r;
      log("cartModel:$cartModel");
      emit(GetCartSuccessState(cartModel: r));
    });
  }

  //! Online Payment
  Future<void> onlinePayment({required String orderId}) async {
    final result = await cartRepo.onlinePayment(orderId: orderId);
    result.fold((l) => emit(OnlinePaymentFailureState(message: l.message)), (
      r,
    ) {
      sessionId = r;
      emit(OnlinePaymentSuccessState(sessionId: r));
    });
  }

  //! Update Order Payment
  Future<void> updateOrderPayemnt({
    required String orderId,
    required double amount,
  }) async {
    final result = await cartRepo.updateOrderPayemnt(
      orderId: orderId,
      amount: amount,
    );
    result.fold(
      (l) => emit(UpdateOrderPaymentFailureState(message: l.message)),
      (r) {
        emit(UpdateOrderPaymentSuccessState());
      },
    );
  }
}
