import 'dart:developer';
import 'package:dartz/dartz.dart';

import '../../../../core/network/network.dart';
import '../../domin/repo/products_repo.dart';
import '../data.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ProductsSource source;

  ProductsRepoImpl(this.source);
  @override
  Future<Either<Failure, ProductDetailsModel>> getProductDetails({
    required String productId,
  }) async {
    try {
      final result = await source.getProductDetails(productId: productId);
      if (result['product'] == null) {
        return Left(ServerFailure("Product not found"));
      }
      log(" Data in repo ${ProductDetailsModel.fromJson(result).toString()}");
      return Right(ProductDetailsModel.fromJson(result));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddItemToCartModel>> addItemToCart({
    required String productId,
    String? fullfilmentCenterId,
  }) async {
    try {
      final result = await source.addItemToCart(
        productId: productId,
        fullfilmentCenterId: fullfilmentCenterId,
      );
      if (result['addItem'] == null) {
        return Left(ServerFailure(result['error']));
      }
      log(" Data in repo ${AddItemToCartModel.fromJson(result).toString()}");
      return Right(AddItemToCartModel.fromJson(result));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
