import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int? inStockQuantity;
  final String? warehouseLocation;
  final bool? isValid;
  final String? catalogId;
  final String? categoryId;
  final DateTime? createdDate;
  final dynamic height;
  final String? id;
  final String? imageUrl;
  final bool? isGift;
  final bool? isReadOnly;
  final bool? isReccuring;
  final dynamic languageCode;
  final dynamic length;
  final String? measureUnit;
  final String? name;
  final dynamic note;
  final String? objectType;
  final String? productId;
  final String? productType;
  final int? quantity;
  final bool? requiredShipping;
  final dynamic shipmentMethodCode;
  final String? sku;
  final int? taxPercentRate;
  final String? taxType;
  final dynamic thumbnailImageUrl;
  final dynamic volumetricWeight;
  final dynamic weight;
  final String? weightUnit;
  final dynamic width;
  final String? fulfillmentCenterId;
  final String? fulfillmentCenterName;

  const Item({
    this.inStockQuantity,
    this.warehouseLocation,
    this.isValid,
    this.catalogId,
    this.categoryId,
    this.createdDate,
    this.height,
    this.id,
    this.imageUrl,
    this.isGift,
    this.isReadOnly,
    this.isReccuring,
    this.languageCode,
    this.length,
    this.measureUnit,
    this.name,
    this.note,
    this.objectType,
    this.productId,
    this.productType,
    this.quantity,
    this.requiredShipping,
    this.shipmentMethodCode,
    this.sku,
    this.taxPercentRate,
    this.taxType,
    this.thumbnailImageUrl,
    this.volumetricWeight,
    this.weight,
    this.weightUnit,
    this.width,
    this.fulfillmentCenterId,
    this.fulfillmentCenterName,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    inStockQuantity: json['inStockQuantity'] as int?,
    warehouseLocation: json['warehouseLocation'] as String?,
    isValid: json['isValid'] as bool?,
    catalogId: json['catalogId'] as String?,
    categoryId: json['categoryId'] as String?,
    createdDate:
        json['createdDate'] == null
            ? null
            : DateTime.parse(json['createdDate'] as String),
    height: json['height'] as dynamic,
    id: json['id'] as String?,
    imageUrl: json['imageUrl'] as String?,
    isGift: json['isGift'] as bool?,
    isReadOnly: json['isReadOnly'] as bool?,
    isReccuring: json['isReccuring'] as bool?,
    languageCode: json['languageCode'] as dynamic,
    length: json['length'] as dynamic,
    measureUnit: json['measureUnit'] as String?,
    name: json['name'] as String?,
    note: json['note'] as dynamic,
    objectType: json['objectType'] as String?,
    productId: json['productId'] as String?,
    productType: json['productType'] as String?,
    quantity: json['quantity'] as int?,
    requiredShipping: json['requiredShipping'] as bool?,
    shipmentMethodCode: json['shipmentMethodCode'] as dynamic,
    sku: json['sku'] as String?,
    taxPercentRate: json['taxPercentRate'] as int?,
    taxType: json['taxType'] as String?,
    thumbnailImageUrl: json['thumbnailImageUrl'] as dynamic,
    volumetricWeight: json['volumetricWeight'] as dynamic,
    weight: json['weight'] as dynamic,
    weightUnit: json['weightUnit'] as String?,
    width: json['width'] as dynamic,
    fulfillmentCenterId: json['fulfillmentCenterId'] as String?,
    fulfillmentCenterName: json['fulfillmentCenterName'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'inStockQuantity': inStockQuantity,
    'warehouseLocation': warehouseLocation,
    'isValid': isValid,
    'catalogId': catalogId,
    'categoryId': categoryId,
    'createdDate': createdDate?.toIso8601String(),
    'height': height,
    'id': id,
    'imageUrl': imageUrl,
    'isGift': isGift,
    'isReadOnly': isReadOnly,
    'isReccuring': isReccuring,
    'languageCode': languageCode,
    'length': length,
    'measureUnit': measureUnit,
    'name': name,
    'note': note,
    'objectType': objectType,
    'productId': productId,
    'productType': productType,
    'quantity': quantity,
    'requiredShipping': requiredShipping,
    'shipmentMethodCode': shipmentMethodCode,
    'sku': sku,
    'taxPercentRate': taxPercentRate,
    'taxType': taxType,
    'thumbnailImageUrl': thumbnailImageUrl,
    'volumetricWeight': volumetricWeight,
    'weight': weight,
    'weightUnit': weightUnit,
    'width': width,
    'fulfillmentCenterId': fulfillmentCenterId,
    'fulfillmentCenterName': fulfillmentCenterName,
  };

  @override
  List<Object?> get props {
    return [
      inStockQuantity,
      warehouseLocation,
      isValid,
      catalogId,
      categoryId,
      createdDate,
      height,
      id,
      imageUrl,
      isGift,
      isReadOnly,
      isReccuring,
      languageCode,
      length,
      measureUnit,
      name,
      note,
      objectType,
      productId,
      productType,
      quantity,
      requiredShipping,
      shipmentMethodCode,
      sku,
      taxPercentRate,
      taxType,
      thumbnailImageUrl,
      volumetricWeight,
      weight,
      weightUnit,
      width,
      fulfillmentCenterId,
      fulfillmentCenterName,
    ];
  }
}
