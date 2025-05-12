import 'package:equatable/equatable.dart';

import 'delivery_address.dart';
import 'price.dart';

class Shipment extends Equatable {
  final String? id;
  final String? shipmentMethodCode;
  final int? taxPercentRate;
  final DeliveryAddress? deliveryAddress;
  final Price? price;

  const Shipment({
    this.id,
    this.shipmentMethodCode,
    this.taxPercentRate,
    this.deliveryAddress,
    this.price,
  });

  factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
    id: json['id'] as String?,
    shipmentMethodCode: json['shipmentMethodCode'] as String?,
    taxPercentRate: json['taxPercentRate'] as int?,
    deliveryAddress:
        json['deliveryAddress'] == null
            ? null
            : DeliveryAddress.fromJson(
              json['deliveryAddress'] as Map<String, dynamic>,
            ),
    price:
        json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'shipmentMethodCode': shipmentMethodCode,
    'taxPercentRate': taxPercentRate,
    'deliveryAddress': deliveryAddress?.toJson(),
    'price': price?.toJson(),
  };

  @override
  List<Object?> get props {
    return [id, shipmentMethodCode, taxPercentRate, deliveryAddress, price];
  }
}
