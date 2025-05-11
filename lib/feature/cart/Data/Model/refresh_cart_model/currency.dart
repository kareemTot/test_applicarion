import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String? code;
  final String? symbol;
  final int? exchangeRate;
  final dynamic customFormatting;

  const Currency({
    this.code,
    this.symbol,
    this.exchangeRate,
    this.customFormatting,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    code: json['code'] as String?,
    symbol: json['symbol'] as String?,
    exchangeRate: json['exchangeRate'] as int?,
    customFormatting: json['customFormatting'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'code': code,
    'symbol': symbol,
    'exchangeRate': exchangeRate,
    'customFormatting': customFormatting,
  };

  @override
  List<Object?> get props {
    return [code, symbol, exchangeRate, customFormatting];
  }
}
