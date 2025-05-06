import 'package:equatable/equatable.dart';

import 'extended_price.dart';

class Item extends Equatable {
  final int? inStockQuantity;
  final String? warehouseLocation;
  final String? catalogId;
  final String? categoryId;
  final DateTime? createdDate;
  final String? id;
  final String? imageUrl;
  final bool? isGift;
  final bool? isReadOnly;
  final bool? isReccuring;
  final dynamic measureUnit;
  final String? name;
  final String? objectType;
  final String? productId;
  final String? productType;
  final int? quantity;
  final bool? requiredShipping;
  final dynamic shipmentMethodCode;
  final String? sku;
  final int? taxPercentRate;
  final String? taxType;
  final dynamic weightUnit;
  final String? fulfillmentCenterId;
  final String? fulfillmentCenterName;
  final ExtendedPrice? extendedPrice;

  const Item({
    this.inStockQuantity,
    this.warehouseLocation,
    this.catalogId,
    this.categoryId,
    this.createdDate,
    this.id,
    this.imageUrl,
    this.isGift,
    this.isReadOnly,
    this.isReccuring,
    this.measureUnit,
    this.name,
    this.objectType,
    this.productId,
    this.productType,
    this.quantity,
    this.requiredShipping,
    this.shipmentMethodCode,
    this.sku,
    this.taxPercentRate,
    this.taxType,
    this.weightUnit,
    this.fulfillmentCenterId,
    this.fulfillmentCenterName,
    this.extendedPrice,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    inStockQuantity: json['inStockQuantity'] as int?,
    warehouseLocation: json['warehouseLocation'] as String?,
    catalogId: json['catalogId'] as String?,
    categoryId: json['categoryId'] as String?,
    createdDate:
        json['createdDate'] == null
            ? null
            : DateTime.parse(json['createdDate'] as String),
    id: json['id'] as String?,
    imageUrl: json['imageUrl'] as String?,
    isGift: json['isGift'] as bool?,
    isReadOnly: json['isReadOnly'] as bool?,
    isReccuring: json['isReccuring'] as bool?,
    measureUnit: json['measureUnit'] as dynamic,
    name: json['name'] as String?,
    objectType: json['objectType'] as String?,
    productId: json['productId'] as String?,
    productType: json['productType'] as String?,
    quantity: json['quantity'] as int?,
    requiredShipping: json['requiredShipping'] as bool?,
    shipmentMethodCode: json['shipmentMethodCode'] as dynamic,
    sku: json['sku'] as String?,
    taxPercentRate: json['taxPercentRate'] as int?,
    taxType: json['taxType'] as String?,
    weightUnit: json['weightUnit'] as dynamic,
    fulfillmentCenterId: json['fulfillmentCenterId'] as String?,
    fulfillmentCenterName: json['fulfillmentCenterName'] as String?,
    extendedPrice:
        json['extendedPrice'] == null
            ? null
            : ExtendedPrice.fromJson(
              json['extendedPrice'] as Map<String, dynamic>,
            ),
  );

  Map<String, dynamic> toJson() => {
    'inStockQuantity': inStockQuantity,
    'warehouseLocation': warehouseLocation,
    'catalogId': catalogId,
    'categoryId': categoryId,
    'createdDate': createdDate?.toIso8601String(),
    'id': id,
    'imageUrl': imageUrl,
    'isGift': isGift,
    'isReadOnly': isReadOnly,
    'isReccuring': isReccuring,
    'measureUnit': measureUnit,
    'name': name,
    'objectType': objectType,
    'productId': productId,
    'productType': productType,
    'quantity': quantity,
    'requiredShipping': requiredShipping,
    'shipmentMethodCode': shipmentMethodCode,
    'sku': sku,
    'taxPercentRate': taxPercentRate,
    'taxType': taxType,
    'weightUnit': weightUnit,
    'fulfillmentCenterId': fulfillmentCenterId,
    'fulfillmentCenterName': fulfillmentCenterName,
    'extendedPrice': extendedPrice?.toJson(),
  };

  @override
  List<Object?> get props {
    return [
      inStockQuantity,
      warehouseLocation,
      catalogId,
      categoryId,
      createdDate,
      id,
      imageUrl,
      isGift,
      isReadOnly,
      isReccuring,
      measureUnit,
      name,
      objectType,
      productId,
      productType,
      quantity,
      requiredShipping,
      shipmentMethodCode,
      sku,
      taxPercentRate,
      taxType,
      weightUnit,
      fulfillmentCenterId,
      fulfillmentCenterName,
      extendedPrice,
    ];
  }
}
