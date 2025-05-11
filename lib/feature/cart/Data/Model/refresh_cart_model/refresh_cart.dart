import 'package:equatable/equatable.dart';

import 'item.dart';
import 'shipping_price.dart';
import 'sub_total.dart';
import 'sub_total_with_tax.dart';
import 'total.dart';

class RefreshCart extends Equatable {
  final String? id;
  final String? name;
  final dynamic status;
  final String? storeId;
  final dynamic fulfillmentCenterId;
  final dynamic channelId;
  final bool? hasPhysicalProducts;
  final bool? isAnonymous;
  final String? customerId;
  final String? customerName;
  final dynamic organizationId;
  final bool? isRecuring;
  final dynamic comment;
  final dynamic purchaseOrderNumber;
  final dynamic volumetricWeight;
  final dynamic weightUnit;
  final dynamic weight;
  final int? taxPercentRate;
  final dynamic taxType;
  final int? itemsCount;
  final int? itemsQuantity;
  final bool? isValid;
  final String? type;
  final Total? total;
  final SubTotal? subTotal;
  final SubTotalWithTax? subTotalWithTax;
  final ShippingPrice? shippingPrice;
  final List<dynamic>? shipments;
  final List<Item>? items;

  const RefreshCart({
    this.id,
    this.name,
    this.status,
    this.storeId,
    this.fulfillmentCenterId,
    this.channelId,
    this.hasPhysicalProducts,
    this.isAnonymous,
    this.customerId,
    this.customerName,
    this.organizationId,
    this.isRecuring,
    this.comment,
    this.purchaseOrderNumber,
    this.volumetricWeight,
    this.weightUnit,
    this.weight,
    this.taxPercentRate,
    this.taxType,
    this.itemsCount,
    this.itemsQuantity,
    this.isValid,
    this.type,
    this.total,
    this.subTotal,
    this.subTotalWithTax,
    this.shippingPrice,
    this.shipments,
    this.items,
  });

  factory RefreshCart.fromJson(Map<String, dynamic> json) => RefreshCart(
    id: json['id'] as String?,
    name: json['name'] as String?,
    status: json['status'] as dynamic,
    storeId: json['storeId'] as String?,
    fulfillmentCenterId: json['fulfillmentCenterId'] as dynamic,
    channelId: json['channelId'] as dynamic,
    hasPhysicalProducts: json['hasPhysicalProducts'] as bool?,
    isAnonymous: json['isAnonymous'] as bool?,
    customerId: json['customerId'] as String?,
    customerName: json['customerName'] as String?,
    organizationId: json['organizationId'] as dynamic,
    isRecuring: json['isRecuring'] as bool?,
    comment: json['comment'] as dynamic,
    purchaseOrderNumber: json['purchaseOrderNumber'] as dynamic,
    volumetricWeight: json['volumetricWeight'] as dynamic,
    weightUnit: json['weightUnit'] as dynamic,
    weight: json['weight'] as dynamic,
    taxPercentRate: json['taxPercentRate'] as int?,
    taxType: json['taxType'] as dynamic,
    itemsCount: json['itemsCount'] as int?,
    itemsQuantity: json['itemsQuantity'] as int?,
    isValid: json['isValid'] as bool?,
    type: json['type'] as String?,
    total:
        json['total'] == null
            ? null
            : Total.fromJson(json['total'] as Map<String, dynamic>),
    subTotal:
        json['subTotal'] == null
            ? null
            : SubTotal.fromJson(json['subTotal'] as Map<String, dynamic>),
    subTotalWithTax:
        json['subTotalWithTax'] == null
            ? null
            : SubTotalWithTax.fromJson(
              json['subTotalWithTax'] as Map<String, dynamic>,
            ),
    shippingPrice:
        json['shippingPrice'] == null
            ? null
            : ShippingPrice.fromJson(
              json['shippingPrice'] as Map<String, dynamic>,
            ),
    shipments: json['shipments'] as List<dynamic>?,
    items:
        (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'status': status,
    'storeId': storeId,
    'fulfillmentCenterId': fulfillmentCenterId,
    'channelId': channelId,
    'hasPhysicalProducts': hasPhysicalProducts,
    'isAnonymous': isAnonymous,
    'customerId': customerId,
    'customerName': customerName,
    'organizationId': organizationId,
    'isRecuring': isRecuring,
    'comment': comment,
    'purchaseOrderNumber': purchaseOrderNumber,
    'volumetricWeight': volumetricWeight,
    'weightUnit': weightUnit,
    'weight': weight,
    'taxPercentRate': taxPercentRate,
    'taxType': taxType,
    'itemsCount': itemsCount,
    'itemsQuantity': itemsQuantity,
    'isValid': isValid,
    'type': type,
    'total': total?.toJson(),
    'subTotal': subTotal?.toJson(),
    'subTotalWithTax': subTotalWithTax?.toJson(),
    'shippingPrice': shippingPrice?.toJson(),
    'shipments': shipments,
    'items': items?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      status,
      storeId,
      fulfillmentCenterId,
      channelId,
      hasPhysicalProducts,
      isAnonymous,
      customerId,
      customerName,
      organizationId,
      isRecuring,
      comment,
      purchaseOrderNumber,
      volumetricWeight,
      weightUnit,
      weight,
      taxPercentRate,
      taxType,
      itemsCount,
      itemsQuantity,
      isValid,
      type,
      total,
      subTotal,
      subTotalWithTax,
      shippingPrice,
      shipments,
      items,
    ];
  }
}
