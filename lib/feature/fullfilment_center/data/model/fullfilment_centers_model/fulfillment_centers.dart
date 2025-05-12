import 'package:equatable/equatable.dart';

import 'item.dart';

class FulfillmentCenters extends Equatable {
  final int? totalCount;
  final List<Item>? items;

  const FulfillmentCenters({this.totalCount, this.items});

  factory FulfillmentCenters.fromJson(Map<String, dynamic> json) {
    return FulfillmentCenters(
      totalCount: json['totalCount'] as int?,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'totalCount': totalCount,
    'items': items?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [totalCount, items];
}
