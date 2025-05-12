import 'package:flutter/material.dart';

class CustomOutOfStockContainerText extends StatelessWidget {
  final double? radius;
  final Color? color;
  const CustomOutOfStockContainerText({super.key, this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color ?? Colors.orange,
        borderRadius: BorderRadius.circular(radius ?? 20),
      ),
      child: const Text(
        "OUT OF STOCK",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
