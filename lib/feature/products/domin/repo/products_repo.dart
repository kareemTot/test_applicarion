import 'package:dartz/dartz.dart';
import 'package:test_applicarion/feature/products/Data/Model/add_items_to_cart_model/add_item_to_cart_model.dart';
import '../../../../core/network/errors/failure.dart';
import '../../Data/Model/products_details_model/product_details_model.dart';

abstract class ProductsRepo {
  Future<Either<Failure, ProductDetailsModel>> getProductDetails({
    required String productId,
  });
  Future<Either<Failure, AddItemToCartModel>> addItemToCart({
    required String productId,
    String? fullfilmentCenterId,
  });
}
