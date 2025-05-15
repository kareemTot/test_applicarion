import 'package:equatable/equatable.dart';

import 'total.dart';

class CreateOrderModel extends Equatable {
  final String? id;
  final String? customerId;
  final Total? total;

  const CreateOrderModel({this.id, this.customerId, this.total});

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) {
    return CreateOrderModel(
      id: json['id'] as String?,
      customerId: json['customerId'] as String?,
      total:
          json['total'] == null
              ? null
              : Total.fromJson(json['total'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'customerId': customerId,
    'total': total?.toJson(),
  };

  @override
  List<Object?> get props => [id, customerId, total];
}
