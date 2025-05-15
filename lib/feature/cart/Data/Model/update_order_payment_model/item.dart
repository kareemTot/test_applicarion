import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String? id;
  final String? productType;
  final String? name;
  final dynamic comment;
  final String? imageUrl;
  final bool? isGift;
  final dynamic shippingMethodCode;
  final dynamic fulfillmentLocationCode;
  final String? fulfillmentCenterId;
  final String? fulfillmentCenterName;
  final dynamic outerId;
  final String? weightUnit;
  final dynamic weight;
  final String? measureUnit;
  final dynamic height;
  final dynamic length;
  final dynamic width;
  final bool? isCancelled;
  final dynamic cancelledDate;
  final dynamic cancelReason;
  final String? objectType;
  final dynamic status;
  final String? categoryId;
  final String? catalogId;
  final String? sku;
  final String? priceId;
  final String? taxType;
  final int? taxPercentRate;
  final int? reserveQuantity;
  final int? quantity;
  final String? productId;

  const Item({
    this.id,
    this.productType,
    this.name,
    this.comment,
    this.imageUrl,
    this.isGift,
    this.shippingMethodCode,
    this.fulfillmentLocationCode,
    this.fulfillmentCenterId,
    this.fulfillmentCenterName,
    this.outerId,
    this.weightUnit,
    this.weight,
    this.measureUnit,
    this.height,
    this.length,
    this.width,
    this.isCancelled,
    this.cancelledDate,
    this.cancelReason,
    this.objectType,
    this.status,
    this.categoryId,
    this.catalogId,
    this.sku,
    this.priceId,
    this.taxType,
    this.taxPercentRate,
    this.reserveQuantity,
    this.quantity,
    this.productId,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json['id'] as String?,
    productType: json['productType'] as String?,
    name: json['name'] as String?,
    comment: json['comment'] as dynamic,
    imageUrl: json['imageUrl'] as String?,
    isGift: json['isGift'] as bool?,
    shippingMethodCode: json['shippingMethodCode'] as dynamic,
    fulfillmentLocationCode: json['fulfillmentLocationCode'] as dynamic,
    fulfillmentCenterId: json['fulfillmentCenterId'] as String?,
    fulfillmentCenterName: json['fulfillmentCenterName'] as String?,
    outerId: json['outerId'] as dynamic,
    weightUnit: json['weightUnit'] as String?,
    weight: json['weight'] as dynamic,
    measureUnit: json['measureUnit'] as String?,
    height: json['height'] as dynamic,
    length: json['length'] as dynamic,
    width: json['width'] as dynamic,
    isCancelled: json['isCancelled'] as bool?,
    cancelledDate: json['cancelledDate'] as dynamic,
    cancelReason: json['cancelReason'] as dynamic,
    objectType: json['objectType'] as String?,
    status: json['status'] as dynamic,
    categoryId: json['categoryId'] as String?,
    catalogId: json['catalogId'] as String?,
    sku: json['sku'] as String?,
    priceId: json['priceId'] as String?,
    taxType: json['taxType'] as String?,
    taxPercentRate: json['taxPercentRate'] as int?,
    reserveQuantity: json['reserveQuantity'] as int?,
    quantity: json['quantity'] as int?,
    productId: json['productId'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'productType': productType,
    'name': name,
    'comment': comment,
    'imageUrl': imageUrl,
    'isGift': isGift,
    'shippingMethodCode': shippingMethodCode,
    'fulfillmentLocationCode': fulfillmentLocationCode,
    'fulfillmentCenterId': fulfillmentCenterId,
    'fulfillmentCenterName': fulfillmentCenterName,
    'outerId': outerId,
    'weightUnit': weightUnit,
    'weight': weight,
    'measureUnit': measureUnit,
    'height': height,
    'length': length,
    'width': width,
    'isCancelled': isCancelled,
    'cancelledDate': cancelledDate,
    'cancelReason': cancelReason,
    'objectType': objectType,
    'status': status,
    'categoryId': categoryId,
    'catalogId': catalogId,
    'sku': sku,
    'priceId': priceId,
    'taxType': taxType,
    'taxPercentRate': taxPercentRate,
    'reserveQuantity': reserveQuantity,
    'quantity': quantity,
    'productId': productId,
  };

  @override
  List<Object?> get props {
    return [
      id,
      productType,
      name,
      comment,
      imageUrl,
      isGift,
      shippingMethodCode,
      fulfillmentLocationCode,
      fulfillmentCenterId,
      fulfillmentCenterName,
      outerId,
      weightUnit,
      weight,
      measureUnit,
      height,
      length,
      width,
      isCancelled,
      cancelledDate,
      cancelReason,
      objectType,
      status,
      categoryId,
      catalogId,
      sku,
      priceId,
      taxType,
      taxPercentRate,
      reserveQuantity,
      quantity,
      productId,
    ];
  }
}
