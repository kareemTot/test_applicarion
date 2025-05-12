import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final dynamic id;
  final dynamic key;
  final String? city;
  final String? countryCode;
  final String? countryName;
  final String? email;
  final dynamic firstName;
  final dynamic middleName;
  final dynamic lastName;
  final String? line1;
  final dynamic line2;
  final dynamic name;
  final dynamic organization;
  final String? phone;
  final dynamic regionId;
  final dynamic regionName;
  final dynamic zip;
  final dynamic outerId;
  final int? addressType;

  const Address({
    this.id,
    this.key,
    this.city,
    this.countryCode,
    this.countryName,
    this.email,
    this.firstName,
    this.middleName,
    this.lastName,
    this.line1,
    this.line2,
    this.name,
    this.organization,
    this.phone,
    this.regionId,
    this.regionName,
    this.zip,
    this.outerId,
    this.addressType,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json['id'] as dynamic,
    key: json['key'] as dynamic,
    city: json['city'] as String?,
    countryCode: json['countryCode'] as String?,
    countryName: json['countryName'] as String?,
    email: json['email'] as String?,
    firstName: json['firstName'] as dynamic,
    middleName: json['middleName'] as dynamic,
    lastName: json['lastName'] as dynamic,
    line1: json['line1'] as String?,
    line2: json['line2'] as dynamic,
    name: json['name'] as dynamic,
    organization: json['organization'] as dynamic,
    phone: json['phone'] as String?,
    regionId: json['regionId'] as dynamic,
    regionName: json['regionName'] as dynamic,
    zip: json['zip'] as dynamic,
    outerId: json['outerId'] as dynamic,
    addressType: json['addressType'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'key': key,
    'city': city,
    'countryCode': countryCode,
    'countryName': countryName,
    'email': email,
    'firstName': firstName,
    'middleName': middleName,
    'lastName': lastName,
    'line1': line1,
    'line2': line2,
    'name': name,
    'organization': organization,
    'phone': phone,
    'regionId': regionId,
    'regionName': regionName,
    'zip': zip,
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
      email,
      firstName,
      middleName,
      lastName,
      line1,
      line2,
      name,
      organization,
      phone,
      regionId,
      regionName,
      zip,
      outerId,
      addressType,
    ];
  }
}
