import 'package:equatable/equatable.dart';
import 'package:test_applicarion/feature/products/Data/Model/products_details_model/inventories.dart';

class AvailabilityData extends Equatable {
  final int? availableQuantity;
  final bool? isBuyable;
  final bool? isAvailable;
  final bool? isInStock;
  final bool? isActive;
  final bool? isTrackInventory;
  final List<Inventories>? inventories;

  const AvailabilityData({
    this.availableQuantity,
    this.isBuyable,
    this.isAvailable,
    this.isInStock,
    this.isActive,
    this.isTrackInventory,
    this.inventories,
  });

  factory AvailabilityData.fromJson(Map<String, dynamic> json) {
    return AvailabilityData(
      availableQuantity: json['availableQuantity'] as int?,
      isBuyable: json['isBuyable'] as bool?,
      isAvailable: json['isAvailable'] as bool?,
      isInStock: json['isInStock'] as bool?,
      isActive: json['isActive'] as bool?,
      isTrackInventory: json['isTrackInventory'] as bool?,
      inventories:
          (json['inventories'] as List<dynamic>?)
              ?.map((e) => Inventories.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'availableQuantity': availableQuantity,
    'isBuyable': isBuyable,
    'isAvailable': isAvailable,
    'isInStock': isInStock,
    'isActive': isActive,
    'isTrackInventory': isTrackInventory,
    'inventories': inventories,
  };

  @override
  List<Object?> get props {
    return [
      availableQuantity,
      isBuyable,
      isAvailable,
      isInStock,
      isActive,
      isTrackInventory,
      inventories,
    ];
  }
}
