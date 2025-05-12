import 'package:equatable/equatable.dart';
import 'address.dart';

class Nearest extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? outerId;
  final String? geoLocation;
  final String? shortDescription;
  final Address? address;
  final List<Nearest>? nearest;

  const Nearest({
    this.id,
    this.name,
    this.description,
    this.outerId,
    this.geoLocation,
    this.shortDescription,
    this.address,
    this.nearest,
  });

  factory Nearest.fromJson(Map<String, dynamic> json) => Nearest(
    id: json['id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    outerId: json['outerId'] as String?,
    geoLocation: json['geoLocation'] as String?,
    shortDescription: json['shortDescription'] as String?,
    address:
        json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
    nearest:
        (json['nearest'] as List<dynamic>?)
            ?.map((e) => Nearest.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'outerId': outerId,
    'geoLocation': geoLocation,
    'shortDescription': shortDescription,
    'address': address?.toJson(),
    'nearest': nearest?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      outerId,
      geoLocation,
      shortDescription,
      address,
      nearest,
    ];
  }
}
