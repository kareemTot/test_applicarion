import 'package:flutter/material.dart';
import '../cubit/product_details_cubit.dart';

class CustomVariationListViewBody extends StatelessWidget {
  final void Function()? onTap;
  final Color borderColor;
  final String variationName;
  final String variationPrice;
  final ProductDetailsCubit cubit;
  final int index;
  final bool isOutOfStock;

  const CustomVariationListViewBody({
    super.key,
    this.onTap,
    required this.borderColor,
    required this.variationName,
    required this.variationPrice,
    required this.cubit,
    required this.index,
    this.isOutOfStock = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: isOutOfStock ? null : onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Chip(
              elevation: 0.0,
              side: BorderSide(
                color: isOutOfStock ? Colors.grey : borderColor,
                width: isOutOfStock ? 0.5 : 1.0,
              ),
              backgroundColor:
                  isOutOfStock ? Colors.grey.withValues(alpha: 0.2) : null,
              label: Text(
                variationName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isOutOfStock ? Colors.grey : null,
                  decoration: isOutOfStock ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ),
        ),
        if (isOutOfStock)
          Positioned(
            right: 8,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.red[100]!),
              ),
              child: Text(
                'Out of stock',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
