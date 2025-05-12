import 'package:equatable/equatable.dart';

import 'add_item.dart';

class AddItemToCartModel extends Equatable {
  final AddItem? addItem;

  const AddItemToCartModel({this.addItem});

  factory AddItemToCartModel.fromJson(Map<String, dynamic> json) {
    return AddItemToCartModel(
      addItem:
          json['addItem'] == null
              ? null
              : AddItem.fromJson(json['addItem'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'addItem': addItem?.toJson()};

  @override
  List<Object?> get props => [addItem];
}
