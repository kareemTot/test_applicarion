import 'package:equatable/equatable.dart';

class Variation extends Equatable {
  final String? id;
  final String? name;
  final String? code;
  final dynamic productType;
  final int? minQuantity;
  final int? maxQuantity;
  final String? slug;

  const Variation({
    this.id,
    this.name,
    this.code,
    this.productType,
    this.minQuantity,
    this.maxQuantity,
    this.slug,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    id: json['id'] as String?,
    name: json['name'] as String?,
    code: json['code'] as String?,
    productType: json['productType'] as dynamic,
    minQuantity: json['minQuantity'] as int?,
    maxQuantity: json['maxQuantity'] as int?,
    slug: json['slug'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'code': code,
    'productType': productType,
    'minQuantity': minQuantity,
    'maxQuantity': maxQuantity,
    'slug': slug,
  };

  @override
  List<Object?> get props {
    return [id, name, code, productType, minQuantity, maxQuantity, slug];
  }
}
