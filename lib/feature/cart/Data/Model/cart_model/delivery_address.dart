import 'package:equatable/equatable.dart';

class DeliveryAddress extends Equatable {
  final String? id;
  final String? key;
  final String? city;
  final String? countryCode;
  final String? countryName;
  final String? firstName;
  final String? lastName;
  final String? line1;
  final dynamic name;
  final String? regionId;
  final String? regionName;
  final dynamic outerId;
  final int? addressType;

  const DeliveryAddress({
    this.id,
    this.key,
    this.city,
    this.countryCode,
    this.countryName,
    this.firstName,
    this.lastName,
    this.line1,
    this.name,
    this.regionId,
    this.regionName,
    this.outerId,
    this.addressType,
  });

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) {
    return DeliveryAddress(
      id: json['id'] as String?,
      key: json['key'] as String?,
      city: json['city'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      line1: json['line1'] as String?,
      name: json['name'] as dynamic,
      regionId: json['regionId'] as String?,
      regionName: json['regionName'] as String?,
      outerId: json['outerId'] as dynamic,
      addressType: json['addressType'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'key': key,
    'city': city,
    'countryCode': countryCode,
    'countryName': countryName,
    'firstName': firstName,
    'lastName': lastName,
    'line1': line1,
    'name': name,
    'regionId': regionId,
    'regionName': regionName,
    'outerId': outerId,
    'addressType': addressType,
  };

  @override
  List<Object?> get props {
    return [
      id,
      key,
      city,
      countryCode,
      countryName,
      firstName,
      lastName,
      line1,
      name,
      regionId,
      regionName,
      outerId,
      addressType,
    ];
  }
}
