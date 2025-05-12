import 'package:equatable/equatable.dart';

import 'list.dart';

class Price extends Equatable {
  final double? discountPercent;
  final String? currency;
  final dynamic validFrom;
  final dynamic startDate;
  final dynamic validUntil;
  final dynamic endDate;
  final String? pricelistId;
  final int? minQuantity;
  final ListModel? list;

  const Price({
    this.discountPercent,
    this.currency,
    this.validFrom,
    this.startDate,
    this.validUntil,
    this.endDate,
    this.pricelistId,
    this.minQuantity,
    this.list,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    discountPercent: json['discountPercent'] as double?,
    currency: json['currency'] as String?,
    validFrom: json['validFrom'] as dynamic,
    startDate: json['startDate'] as dynamic,
    validUntil: json['validUntil'] as dynamic,
    endDate: json['endDate'] as dynamic,
    pricelistId: json['pricelistId'] as String?,
    minQuantity: json['minQuantity'] as int?,
    list:
        json['list'] == null
            ? null
            : ListModel.fromJson(json['list'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'discountPercent': discountPercent,
    'currency': currency,
    'validFrom': validFrom,
    'startDate': startDate,
    'validUntil': validUntil,
    'endDate': endDate,
    'pricelistId': pricelistId,
    'minQuantity': minQuantity,
    'list': list?.toJson(),
  };

  @override
  List<Object?> get props {
    return [
      discountPercent,
      currency,
      validFrom,
      startDate,
      validUntil,
      endDate,
      pricelistId,
      minQuantity,
      list,
    ];
  }
}
