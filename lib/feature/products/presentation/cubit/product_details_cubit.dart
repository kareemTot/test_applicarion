import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_applicarion/feature/products/domin/repo/products_repo.dart';

import '../../Data/Model/product_details_model/product_details_model.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductsRepo _repo;
  ProductDetailsCubit(this._repo) : super(ProductDetailsInitial());

  ProductDetailsModel? productDetailsModel;

  Future<void> getProductDetails({required String productId}) async {
    emit(ProductDetailsLoading());
    final result = await _repo.getProductDetails(productId: productId);
    result.fold((l) => emit(ProductDetailsFailureState(l.message)), (r) {
      productDetailsModel = r;
      log("productId:$productId");
      log(
        "========================= ${productDetailsModel?.product?.variations.toString() ?? ""}",
      );
      emit(ProductDetailsSuccessState(r));
    });
  }
}
