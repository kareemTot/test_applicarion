import 'package:equatable/equatable.dart';

import 'currency.dart';

class SubTotal extends Equatable {
  final int? amount;
  final int? decimalDigits;
  final String? formattedAmount;
  final String? formattedAmountWithoutCurrency;
  final String? formattedAmountWithoutPoint;
  final String? formattedAmountWithoutPointAndCurrency;
  final Currency? currency;

  const SubTotal({
    this.amount,
    this.decimalDigits,
    this.formattedAmount,
    this.formattedAmountWithoutCurrency,
    this.formattedAmountWithoutPoint,
    this.formattedAmountWithoutPointAndCurrency,
    this.currency,
  });

  factory SubTotal.fromJson(Map<String, dynamic> json) => SubTotal(
    amount: json['amount'] as int?,
    decimalDigits: json['decimalDigits'] as int?,
    formattedAmount: json['formattedAmount'] as String?,
    formattedAmountWithoutCurrency:
        json['formattedAmountWithoutCurrency'] as String?,
    formattedAmountWithoutPoint: json['formattedAmountWithoutPoint'] as String?,
    formattedAmountWithoutPointAndCurrency:
        json['formattedAmountWithoutPointAndCurrency'] as String?,
    currency:
        json['currency'] == null
            ? null
            : Currency.fromJson(json['currency'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'decimalDigits': decimalDigits,
    'formattedAmount': formattedAmount,
    'formattedAmountWithoutCurrency': formattedAmountWithoutCurrency,
    'formattedAmountWithoutPoint': formattedAmountWithoutPoint,
    'formattedAmountWithoutPointAndCurrency':
        formattedAmountWithoutPointAndCurrency,
    'currency': currency?.toJson(),
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
      currency,
    ];
  }
}
