import 'package:equatable/equatable.dart';
import 'package:test_applicarion/feature/products/Data/Model/product_details_model/availability_data.dart';

import 'image.dart';
import 'price.dart';
import 'variation.dart';

class Product extends Equatable {
  final String? id;
  final String? code;
  final String? catalogId;
  final String? productType;
  final int? minQuantity;
  final int? maxQuantity;
  final String? outline;
  final String? slug;
  final String? name;
  final String? imgSrc;
  final String? outerId;
  final dynamic brandName;
  final bool? hasVariations;
  final bool? inWishlist;
  final Price? price;
  final List<dynamic>? descriptions;
  final List<Image>? images;
  final List<Price>? prices;
  final List<Variation>? variations;
  final dynamic description;
  final dynamic minVariationPrice;
  final AvailabilityData? availabilityData;

  const Product({
    this.id,
    this.code,
    this.catalogId,
    this.productType,
    this.minQuantity,
    this.maxQuantity,
    this.outline,
    this.slug,
    this.name,
    this.imgSrc,
    this.outerId,
    this.brandName,
    this.hasVariations,
    this.inWishlist,
    this.price,
    this.descriptions,
    this.images,
    this.prices,
    this.variations,
    this.description,
    this.minVariationPrice,
    this.availabilityData,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'] as String?,
    code: json['code'] as String?,
    catalogId: json['catalogId'] as String?,
    productType: json['productType'] as String?,
    minQuantity: json['minQuantity'] as int?,
    maxQuantity: json['maxQuantity'] as int?,
    outline: json['outline'] as String?,
    slug: json['slug'] as String?,
    name: json['name'] as String?,
    imgSrc: json['imgSrc'] as String?,
    outerId: json['outerId'] as String?,
    brandName: json['brandName'] as dynamic,
    hasVariations: json['hasVariations'] as bool?,
    inWishlist: json['inWishlist'] as bool?,
    price:
        json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
    descriptions: json['descriptions'] as List<dynamic>?,
    images:
        (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
    prices:
        (json['prices'] as List<dynamic>?)
            ?.map((e) => Price.fromJson(e as Map<String, dynamic>))
            .toList(),
    variations:
        (json['variations'] as List<dynamic>?)
            ?.map((e) => Variation.fromJson(e as Map<String, dynamic>))
            .toList(),
    description: json['description'] as dynamic,
    minVariationPrice: json['minVariationPrice'] as dynamic,
    availabilityData:
        json['availabilityData'] == null
            ? null
            : AvailabilityData.fromJson(
              json['availabilityData'] as Map<String, dynamic>,
            ),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'catalogId': catalogId,
    'productType': productType,
    'minQuantity': minQuantity,
    'maxQuantity': maxQuantity,
    'outline': outline,
    'slug': slug,
    'name': name,
    'imgSrc': imgSrc,
    'outerId': outerId,
    'brandName': brandName,
    'hasVariations': hasVariations,
    'inWishlist': inWishlist,
    'price': price?.toJson(),
    'descriptions': descriptions,
    'images': images?.map((e) => e.toJson()).toList(),
    'prices': prices?.map((e) => e.toJson()).toList(),
    'variations': variations?.map((e) => e.toJson()).toList(),
    'description': description,
    'minVariationPrice': minVariationPrice,
  };

  @override
  List<Object?> get props {
    return [
      id,
      code,
      catalogId,
      productType,
      minQuantity,
      maxQuantity,
      outline,
      slug,
      name,
      imgSrc,
      outerId,
      brandName,
      hasVariations,
      inWishlist,
      price,
      descriptions,
      images,
      prices,
      variations,
      description,
      minVariationPrice,
    ];
  }
}
