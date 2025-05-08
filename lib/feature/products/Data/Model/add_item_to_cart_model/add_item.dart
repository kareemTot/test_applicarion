import 'package:equatable/equatable.dart';

import 'item.dart';

class AddItem extends Equatable {
  final int? itemsCount;
  final List<Item>? items;
  final dynamic fulfillmentCenterId;

  const AddItem({this.itemsCount, this.items, this.fulfillmentCenterId});

  factory AddItem.fromJson(Map<String, dynamic> json) => AddItem(
    itemsCount: json['itemsCount'] as int?,
    items:
        (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
    fulfillmentCenterId: json['fulfillmentCenterId'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'itemsCount': itemsCount,
    'items': items?.map((e) => e.toJson()).toList(),
    'fulfillmentCenterId': fulfillmentCenterId,
  };

  @override
  List<Object?> get props => [itemsCount, items, fulfillmentCenterId];
}
