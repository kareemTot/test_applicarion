import 'package:equatable/equatable.dart';
import '../../model.dart';

class CartModel extends Equatable {
  final String? id;
  final String? name;
  final String? storeId;
  final bool? hasPhysicalProducts;
  final bool? isAnonymous;
  final String? customerId;
  final String? customerName;
  final bool? isRecuring;
  final int? taxPercentRate;
  final int? itemsCount;
  final int? itemsQuantity;
  final String? type;
  final List<CartItem>? items;
  final CartTotal? total;
  final List<Shipment>? shipments;
  final CartSubTotal? subTotal;
  final TaxTotal? taxTotal;
  final List<dynamic>? taxDetails;
  final CartShippingPrice? shippingPrice;
  final ShippingTotal? shippingTotal;
  final List<dynamic>? discounts;

  const CartModel({
    this.id,
    this.name,
    this.storeId,
    this.hasPhysicalProducts,
    this.isAnonymous,
    this.customerId,
    this.customerName,
    this.isRecuring,
    this.taxPercentRate,
    this.itemsCount,
    this.itemsQuantity,
    this.type,
    this.items,
    this.total,
    this.shipments,
    this.subTotal,
    this.taxTotal,
    this.taxDetails,
    this.shippingPrice,
    this.shippingTotal,
    this.discounts,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json['id'] as String?,
    name: json['name'] as String?,
    storeId: json['storeId'] as String?,
    hasPhysicalProducts: json['hasPhysicalProducts'] as bool?,
    isAnonymous: json['isAnonymous'] as bool?,
    customerId: json['customerId'] as String?,
    customerName: json['customerName'] as String?,
    isRecuring: json['isRecuring'] as bool?,
    taxPercentRate: json['taxPercentRate'] as int?,
    itemsCount: json['itemsCount'] as int?,
    itemsQuantity: json['itemsQuantity'] as int?,
    type: json['type'] as String?,
    items:
        (json['items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
    total:
        json['total'] == null
            ? null
            : CartTotal.fromJson(json['total'] as Map<String, dynamic>),
    shipments:
        (json['shipments'] as List<dynamic>?)
            ?.map((e) => Shipment.fromJson(e as Map<String, dynamic>))
            .toList(),
    subTotal:
        json['subTotal'] == null
            ? null
            : CartSubTotal.fromJson(json['subTotal'] as Map<String, dynamic>),
    taxTotal:
        json['taxTotal'] == null
            ? null
            : TaxTotal.fromJson(json['taxTotal'] as Map<String, dynamic>),
    taxDetails: json['taxDetails'] as List<dynamic>?,
    shippingPrice:
        json['shippingPrice'] == null
            ? null
            : CartShippingPrice.fromJson(
              json['shippingPrice'] as Map<String, dynamic>,
            ),
    shippingTotal:
        json['shippingTotal'] == null
            ? null
            : ShippingTotal.fromJson(
              json['shippingTotal'] as Map<String, dynamic>,
            ),
    discounts: json['discounts'] as List<dynamic>?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'storeId': storeId,
    'hasPhysicalProducts': hasPhysicalProducts,
    'isAnonymous': isAnonymous,
    'customerId': customerId,
    'customerName': customerName,
    'isRecuring': isRecuring,
    'taxPercentRate': taxPercentRate,
    'itemsCount': itemsCount,
    'itemsQuantity': itemsQuantity,
    'type': type,
    'items': items?.map((e) => e.toJson()).toList(),
    'total': total?.toJson(),
    'shipments': shipments?.map((e) => e.toJson()).toList(),
    'subTotal': subTotal?.toJson(),
    'taxTotal': taxTotal?.toJson(),
    'taxDetails': taxDetails,
    'shippingPrice': shippingPrice?.toJson(),
    'shippingTotal': shippingTotal?.toJson(),
    'discounts': discounts,
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      storeId,
      hasPhysicalProducts,
      isAnonymous,
      customerId,
      customerName,
      isRecuring,
      taxPercentRate,
      itemsCount,
      itemsQuantity,
      type,
      items,
      total,
      shipments,
      subTotal,
      taxTotal,
      taxDetails,
      shippingPrice,
      shippingTotal,
      discounts,
    ];
  }
}
