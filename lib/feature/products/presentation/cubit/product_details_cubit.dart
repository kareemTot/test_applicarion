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
  final Set<int> selectedVariations = {};
  String? productName;
  String? productCode;
  String? productImage;

  bool isSelectedVariation(int index) => selectedVariations.contains(index);

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

  void toggleVariationSelection(int index) {
    if (isSelectedVariation(index)) {
      selectedVariations.remove(index);
    } else {
      selectedVariations.clear();
      selectedVariations.add(index);
      productName = productDetailsModel?.product?.variations?[index].name;
      productCode = productDetailsModel?.product?.variations?[index].code;
      productImage =
          productDetailsModel?.product?.variations?[index].images?[0].url;
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
    emit(RemoveSelectedVariation());
  }
}
