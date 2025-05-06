import 'package:equatable/equatable.dart';

class AvailabilityData extends Equatable {
  final int? availableQuantity;
  final bool? isBuyable;
  final bool? isAvailable;
  final bool? isInStock;
  final bool? isActive;
  final bool? isTrackInventory;

  const AvailabilityData({
    this.availableQuantity,
    this.isBuyable,
    this.isAvailable,
    this.isInStock,
    this.isActive,
    this.isTrackInventory,
  });

  factory AvailabilityData.fromJson(Map<String, dynamic> json) {
    return AvailabilityData(
      availableQuantity: json['availableQuantity'] as int?,
      isBuyable: json['isBuyable'] as bool?,
      isAvailable: json['isAvailable'] as bool?,
      isInStock: json['isInStock'] as bool?,
      isActive: json['isActive'] as bool?,
      isTrackInventory: json['isTrackInventory'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'availableQuantity': availableQuantity,
    'isBuyable': isBuyable,
    'isAvailable': isAvailable,
    'isInStock': isInStock,
    'isActive': isActive,
    'isTrackInventory': isTrackInventory,
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
    ];
  }
}
