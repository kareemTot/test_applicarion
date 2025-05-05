import 'package:equatable/equatable.dart';

import 'update_order_dynamic_properties.dart';

class UpdateOrderDynamicPropertyModel extends Equatable {
  final UpdateOrderDynamicProperties? updateOrderDynamicProperties;

  const UpdateOrderDynamicPropertyModel({this.updateOrderDynamicProperties});

  factory UpdateOrderDynamicPropertyModel.fromJson(Map<String, dynamic> json) {
    return UpdateOrderDynamicPropertyModel(
      updateOrderDynamicProperties:
          json['updateOrderDynamicProperties'] == null
              ? null
              : UpdateOrderDynamicProperties.fromJson(
                json['updateOrderDynamicProperties'] as Map<String, dynamic>,
              ),
    );
  }

  Map<String, dynamic> toJson() => {
    'updateOrderDynamicProperties': updateOrderDynamicProperties?.toJson(),
  };

  @override
  List<Object?> get props => [updateOrderDynamicProperties];
}
