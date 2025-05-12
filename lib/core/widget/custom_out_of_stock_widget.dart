import 'dart:ui';

import 'package:flutter/material.dart';

import 'custom_out_of_stock_container_text.dart';

class CustomOutOfStockWidget extends StatelessWidget {
  final void Function()? onTap;
  const CustomOutOfStockWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              color: Colors.black.withValues(alpha: 0.3),
              child: Center(child: CustomOutOfStockContainerText()),
            ),
          ),
        ),
      ),
    );
  }
}
