import 'package:equatable/equatable.dart';

import 'refresh_cart.dart';

class RefreshCartModel extends Equatable {
  final RefreshCart? refreshCart;

  const RefreshCartModel({this.refreshCart});

  factory RefreshCartModel.fromJson(Map<String, dynamic> json) {
    return RefreshCartModel(
      refreshCart:
          json['refreshCart'] == null
              ? null
              : RefreshCart.fromJson(
                json['refreshCart'] as Map<String, dynamic>,
              ),
    );
  }

  Map<String, dynamic> toJson() => {'refreshCart': refreshCart?.toJson()};

  @override
  List<Object?> get props => [refreshCart];
}
