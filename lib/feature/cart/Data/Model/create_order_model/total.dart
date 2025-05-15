import 'package:equatable/equatable.dart';

class Total extends Equatable {
  final double? amount;

  const Total({this.amount});

  factory Total.fromJson(Map<String, dynamic> json) =>
      Total(amount: json['amount'] as double?);

  Map<String, dynamic> toJson() => {'amount': amount};

  @override
  List<Object?> get props => [amount];
}
