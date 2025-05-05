import 'package:dartz/dartz.dart';
import '../../../../core/network/errors/failure.dart';
import '../../Data/Model/product_details_model/product_details_model.dart';

abstract class ProductsRepo {
  Future<Either<Failure, ProductDetailsModel>> getProductDetails({
    required String productId,
  });
}
