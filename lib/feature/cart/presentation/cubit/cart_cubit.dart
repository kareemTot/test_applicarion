import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_applicarion/feature/cart/domain/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit(this.cartRepo) : super(CartInitial());

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
}
