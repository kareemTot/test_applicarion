import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:test_applicarion/core/network/errors/failure.dart';
import 'package:test_applicarion/feature/products/Data/source/base/products_source.dart';
import '../../domin/repo/products_repo.dart';
import '../Model/product_details_model/product_details_model.dart';

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
}
