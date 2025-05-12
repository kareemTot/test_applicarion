import 'package:equatable/equatable.dart';
import 'availability_data.dart';
import 'image.dart';
import 'price.dart';

class Variation extends Equatable {
  final String? id;
  final String? name;
  final String? code;
  final dynamic productType;
  final int? minQuantity;
  final int? maxQuantity;
  final String? slug;
  final Price? price;
  final AvailabilityData? availabilityData;
  final List<Price>? prices;
  final List<Image>? images;

  const Variation({
    this.id,
    this.name,
    this.code,
    this.productType,
    this.minQuantity,
    this.maxQuantity,
    this.slug,
    this.price,
    this.availabilityData,
    this.prices,
    this.images,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    id: json['id'] as String?,
    name: json['name'] as String?,
    code: json['code'] as String?,
    productType: json['productType'] as dynamic,
    minQuantity: json['minQuantity'] as int?,
    maxQuantity: json['maxQuantity'] as int?,
    slug: json['slug'] as String?,
    price:
        json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
    availabilityData:
        json['availabilityData'] == null
            ? null
            : AvailabilityData.fromJson(
              json['availabilityData'] as Map<String, dynamic>,
            ),
    prices:
        (json['prices'] as List<dynamic>?)
            ?.map((e) => Price.fromJson(e as Map<String, dynamic>))
            .toList(),
    images:
        (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'code': code,
    'productType': productType,
    'minQuantity': minQuantity,
    'maxQuantity': maxQuantity,
    'slug': slug,
    'price': price?.toJson(),
    'availabilityData': availabilityData?.toJson(),
    'prices': prices?.map((e) => e.toJson()).toList(),
    'images': images?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      code,
      productType,
      minQuantity,
      maxQuantity,
      slug,
      price,
      availabilityData,
      prices,
      images,
    ];
  }
}
