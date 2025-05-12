import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_applicarion/feature/cart/domain/repo/cart_repo.dart';
import '../../Data/Model/carts_model/cart_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit(this.cartRepo) : super(CartInitial());

  CartModel? cartModel;

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

  Future<void> getCartInfo() async {
    emit(GetCartLoadingState());
    final result = await cartRepo.cartInfo();
    result.fold((l) => emit(GetCartFailureState(message: l.message)), (r) {
      cartModel = r;
      log("cartModel:$cartModel");
      emit(GetCartSuccessState(cartModel: r));
    });
  }
}
