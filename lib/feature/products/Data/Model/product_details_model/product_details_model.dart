import 'package:equatable/equatable.dart';

import 'product.dart';

class ProductDetailsModel extends Equatable {
  final Product? product;

  const ProductDetailsModel({this.product});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      product:
          json['product'] == null
              ? null
              : Product.fromJson(json['product'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'product': product?.toJson()};

  @override
  List<Object?> get props => [product];
}
