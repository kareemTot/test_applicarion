import 'package:equatable/equatable.dart';

import 'fulfillment_centers.dart';

class FullfilmentCenterModel extends Equatable {
  final FulfillmentCenters? fulfillmentCenters;

  const FullfilmentCenterModel({this.fulfillmentCenters});

  factory FullfilmentCenterModel.fromJson(Map<String, dynamic> json) {
    return FullfilmentCenterModel(
      fulfillmentCenters:
          json['fulfillmentCenters'] == null
              ? null
              : FulfillmentCenters.fromJson(
                json['fulfillmentCenters'] as Map<String, dynamic>,
              ),
    );
  }

  Map<String, dynamic> toJson() => {
    'fulfillmentCenters': fulfillmentCenters?.toJson(),
  };

  @override
  List<Object?> get props => [fulfillmentCenters];
}
