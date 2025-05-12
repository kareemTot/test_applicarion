import 'package:equatable/equatable.dart';

class ListModel extends Equatable {
  final double? amount;
  final int? decimalDigits;
  final String? formattedAmount;
  final String? formattedAmountWithoutCurrency;
  final String? formattedAmountWithoutPoint;
  final String? formattedAmountWithoutPointAndCurrency;

  const ListModel({
    this.amount,
    this.decimalDigits,
    this.formattedAmount,
    this.formattedAmountWithoutCurrency,
    this.formattedAmountWithoutPoint,
    this.formattedAmountWithoutPointAndCurrency,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
    amount: json['amount'] as double?,
    decimalDigits: json['decimalDigits'] as int?,
    formattedAmount: json['formattedAmount'] as String?,
    formattedAmountWithoutCurrency:
        json['formattedAmountWithoutCurrency'] as String?,
    formattedAmountWithoutPoint: json['formattedAmountWithoutPoint'] as String?,
    formattedAmountWithoutPointAndCurrency:
        json['formattedAmountWithoutPointAndCurrency'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'decimalDigits': decimalDigits,
    'formattedAmount': formattedAmount,
    'formattedAmountWithoutCurrency': formattedAmountWithoutCurrency,
    'formattedAmountWithoutPoint': formattedAmountWithoutPoint,
    'formattedAmountWithoutPointAndCurrency':
        formattedAmountWithoutPointAndCurrency,
  };

  @override
  List<Object?> get props {
    return [
      amount,
      decimalDigits,
      formattedAmount,
      formattedAmountWithoutCurrency,
      formattedAmountWithoutPoint,
      formattedAmountWithoutPointAndCurrency,
    ];
  }
}
