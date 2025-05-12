import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_applicarion/feature/products/domin/repo/products_repo.dart';
import '../../Data/Model/products_details_model/product_details_model.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductsRepo _repo;
  ProductDetailsCubit(this._repo) : super(ProductDetailsInitial());

  ProductDetailsModel? productDetailsModel;
  final Set<int> selectedVariations = {};
  String? productName;
  String? productCode;
  String? productImage;
  String? productPrice;

  bool isSelectedVariation(int index) => selectedVariations.contains(index);

  Future<void> getProductDetails({required String productId}) async {
    emit(ProductDetailsLoading());
    final result = await _repo.getProductDetails(productId: productId);
    result.fold((l) => emit(ProductDetailsFailureState(l.message)), (r) {
      productDetailsModel = r;
      log("productId:$productId");
      emit(ProductDetailsSuccessState(r));
    });
  }

  void toggleVariationSelection(int index) {
    if (isSelectedVariation(index)) {
      clearSelection();
    } else {
      clearSelection();
      selectedVariations.add(index);
      productName = productDetailsModel?.product?.variations?[index].name;
      productCode = productDetailsModel?.product?.variations?[index].code;
      productImage =
          productDetailsModel?.product?.variations?[index].images?[0].url;
      productPrice =
          productDetailsModel
              ?.product
              ?.variations?[index]
              .price
              ?.list
              ?.formattedAmount;
    }
    emit(ChangeSelectedVariation(index));
  }

  String textSepereatedFunction(String input) {
    final regex = RegExp(r'(\d+\/\d+\s*كيلو)');
    final match = regex.firstMatch(input);
    return match?.group(0) ?? '';
  }

  void clearSelection() {
    selectedVariations.clear();
    productName = productDetailsModel?.product?.name;
    productCode = productDetailsModel?.product?.code;
    productImage = productDetailsModel?.product?.images?.firstOrNull?.url;
    productPrice = productDetailsModel?.product?.price?.list?.formattedAmount;
    emit(RemoveSelectedVariation());
  }

  Future<void> addItemToCart({
    required String productId,
    String? fullfilmentCenterId,
  }) async {
    emit(AddItemToCartLoadingState());
    final result = await _repo.addItemToCart(
      productId: productId,
      fullfilmentCenterId: fullfilmentCenterId,
    );
    result.fold((l) => emit(AddItemToCartFailureState(l.message)), (r) {
      emit(AddItemToCartSuccessState());
    });
  }
}
