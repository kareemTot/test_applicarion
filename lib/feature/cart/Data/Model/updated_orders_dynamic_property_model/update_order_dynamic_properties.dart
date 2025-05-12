import 'package:equatable/equatable.dart';

import 'item.dart';

class UpdateOrderDynamicProperties extends Equatable {
  final String? id;
  final String? operationType;
  final dynamic parentOperationId;
  final String? number;
  final bool? isApproved;
  final String? status;
  final dynamic comment;
  final dynamic outerId;
  final bool? isCancelled;
  final dynamic cancelledDate;
  final dynamic cancelReason;
  final String? objectType;
  final String? customerId;
  final String? customerName;
  final dynamic channelId;
  final String? storeId;
  final dynamic storeName;
  final dynamic organizationId;
  final dynamic organizationName;
  final dynamic employeeId;
  final dynamic employeeName;
  final String? shoppingCartId;
  final bool? isPrototype;
  final dynamic subscriptionNumber;
  final dynamic subscriptionId;
  final dynamic purchaseOrderNumber;
  final int? feeWithTax;
  final int? feeTotal;
  final int? feeTotalWithTax;
  final dynamic taxType;
  final int? taxPercentRate;
  final dynamic languageCode;
  final DateTime? createdDate;
  final String? createdBy;
  final DateTime? modifiedDate;
  final String? modifiedBy;
  final List<dynamic>? coupons;
  final List<Item>? items;

  const UpdateOrderDynamicProperties({
    this.id,
    this.operationType,
    this.parentOperationId,
    this.number,
    this.isApproved,
    this.status,
    this.comment,
    this.outerId,
    this.isCancelled,
    this.cancelledDate,
    this.cancelReason,
    this.objectType,
    this.customerId,
    this.customerName,
    this.channelId,
    this.storeId,
    this.storeName,
    this.organizationId,
    this.organizationName,
    this.employeeId,
    this.employeeName,
    this.shoppingCartId,
    this.isPrototype,
    this.subscriptionNumber,
    this.subscriptionId,
    this.purchaseOrderNumber,
    this.feeWithTax,
    this.feeTotal,
    this.feeTotalWithTax,
    this.taxType,
    this.taxPercentRate,
    this.languageCode,
    this.createdDate,
    this.createdBy,
    this.modifiedDate,
    this.modifiedBy,
    this.coupons,
    this.items,
  });

  factory UpdateOrderDynamicProperties.fromJson(Map<String, dynamic> json) {
    return UpdateOrderDynamicProperties(
      id: json['id'] as String?,
      operationType: json['operationType'] as String?,
      parentOperationId: json['parentOperationId'] as dynamic,
      number: json['number'] as String?,
      isApproved: json['isApproved'] as bool?,
      status: json['status'] as String?,
      comment: json['comment'] as dynamic,
      outerId: json['outerId'] as dynamic,
      isCancelled: json['isCancelled'] as bool?,
      cancelledDate: json['cancelledDate'] as dynamic,
      cancelReason: json['cancelReason'] as dynamic,
      objectType: json['objectType'] as String?,
      customerId: json['customerId'] as String?,
      customerName: json['customerName'] as String?,
      channelId: json['channelId'] as dynamic,
      storeId: json['storeId'] as String?,
      storeName: json['storeName'] as dynamic,
      organizationId: json['organizationId'] as dynamic,
      organizationName: json['organizationName'] as dynamic,
      employeeId: json['employeeId'] as dynamic,
      employeeName: json['employeeName'] as dynamic,
      shoppingCartId: json['shoppingCartId'] as String?,
      isPrototype: json['isPrototype'] as bool?,
      subscriptionNumber: json['subscriptionNumber'] as dynamic,
      subscriptionId: json['subscriptionId'] as dynamic,
      purchaseOrderNumber: json['purchaseOrderNumber'] as dynamic,
      feeWithTax: json['feeWithTax'] as int?,
      feeTotal: json['feeTotal'] as int?,
      feeTotalWithTax: json['feeTotalWithTax'] as int?,
      taxType: json['taxType'] as dynamic,
      taxPercentRate: json['taxPercentRate'] as int?,
      languageCode: json['languageCode'] as dynamic,
      createdDate:
          json['createdDate'] == null
              ? null
              : DateTime.parse(json['createdDate'] as String),
      createdBy: json['createdBy'] as String?,
      modifiedDate:
          json['modifiedDate'] == null
              ? null
              : DateTime.parse(json['modifiedDate'] as String),
      modifiedBy: json['modifiedBy'] as String?,
      coupons: json['coupons'] as List<dynamic>?,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'operationType': operationType,
    'parentOperationId': parentOperationId,
    'number': number,
    'isApproved': isApproved,
    'status': status,
    'comment': comment,
    'outerId': outerId,
    'isCancelled': isCancelled,
    'cancelledDate': cancelledDate,
    'cancelReason': cancelReason,
    'objectType': objectType,
    'customerId': customerId,
    'customerName': customerName,
    'channelId': channelId,
    'storeId': storeId,
    'storeName': storeName,
    'organizationId': organizationId,
    'organizationName': organizationName,
    'employeeId': employeeId,
    'employeeName': employeeName,
    'shoppingCartId': shoppingCartId,
    'isPrototype': isPrototype,
    'subscriptionNumber': subscriptionNumber,
    'subscriptionId': subscriptionId,
    'purchaseOrderNumber': purchaseOrderNumber,
    'feeWithTax': feeWithTax,
    'feeTotal': feeTotal,
    'feeTotalWithTax': feeTotalWithTax,
    'taxType': taxType,
    'taxPercentRate': taxPercentRate,
    'languageCode': languageCode,
    'createdDate': createdDate?.toIso8601String(),
    'createdBy': createdBy,
    'modifiedDate': modifiedDate?.toIso8601String(),
    'modifiedBy': modifiedBy,
    'coupons': coupons,
    'items': items?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      operationType,
      parentOperationId,
      number,
      isApproved,
      status,
      comment,
      outerId,
      isCancelled,
      cancelledDate,
      cancelReason,
      objectType,
      customerId,
      customerName,
      channelId,
      storeId,
      storeName,
      organizationId,
      organizationName,
      employeeId,
      employeeName,
      shoppingCartId,
      isPrototype,
      subscriptionNumber,
      subscriptionId,
      purchaseOrderNumber,
      feeWithTax,
      feeTotal,
      feeTotalWithTax,
      taxType,
      taxPercentRate,
      languageCode,
      createdDate,
      createdBy,
      modifiedDate,
      modifiedBy,
      coupons,
      items,
    ];
  }
}
