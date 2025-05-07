import 'package:flutter/material.dart';

import '../cubit/product_details_cubit.dart';

class CustomVariationListViewBody extends StatelessWidget {
  final void Function()? onTap;
  final Color borderColor;
  final String variationName;
  final String variationPrice;
  final ProductDetailsCubit cubit;
  final int index;

  const CustomVariationListViewBody({
    super.key,
    this.onTap,
    required this.borderColor,
    required this.variationName,
    required this.variationPrice,
    required this.cubit,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                elevation: 0.0,
                side: BorderSide(color: borderColor),
                label: Text(
                  variationName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
