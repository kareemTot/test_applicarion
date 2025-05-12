import 'package:equatable/equatable.dart';

class Inventories extends Equatable {
  final int? inStockQuantity;
  final int? reservedQuantity;
  final String? fulfillmentCenterId;
  final String? fulfillmentCenterName;
  final bool? allowPreorder;
  final bool? allowBackorder;
  final dynamic preorderAvailabilityDate;
  final dynamic backorderAvailabilityDate;

  const Inventories({
    this.inStockQuantity,
    this.reservedQuantity,
    this.fulfillmentCenterId,
    this.fulfillmentCenterName,
    this.allowPreorder,
    this.allowBackorder,
    this.preorderAvailabilityDate,
    this.backorderAvailabilityDate,
  });

  factory Inventories.fromJson(Map<String, dynamic> json) => Inventories(
    inStockQuantity: json['inStockQuantity'] as int?,
    reservedQuantity: json['reservedQuantity'] as int?,
    fulfillmentCenterId: json['fulfillmentCenterId'] as String?,
    fulfillmentCenterName: json['fulfillmentCenterName'] as String?,
    allowPreorder: json['allowPreorder'] as bool?,
    allowBackorder: json['allowBackorder'] as bool?,
    preorderAvailabilityDate: json['preorderAvailabilityDate'] as dynamic,
    backorderAvailabilityDate: json['backorderAvailabilityDate'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'inStockQuantity': inStockQuantity,
    'reservedQuantity': reservedQuantity,
    'fulfillmentCenterId': fulfillmentCenterId,
    'fulfillmentCenterName': fulfillmentCenterName,
    'allowPreorder': allowPreorder,
    'allowBackorder': allowBackorder,
    'preorderAvailabilityDate': preorderAvailabilityDate,
    'backorderAvailabilityDate': backorderAvailabilityDate,
  };

  @override
  List<Object?> get props {
    return [
      inStockQuantity,
      reservedQuantity,
      fulfillmentCenterId,
      fulfillmentCenterName,
      allowPreorder,
      allowBackorder,
      preorderAvailabilityDate,
      backorderAvailabilityDate,
    ];
  }
}
