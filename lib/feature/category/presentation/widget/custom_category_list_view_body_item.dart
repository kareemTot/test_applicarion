import 'package:flutter/material.dart';

import '../../../../core/extensions/my_colors.dart';
import '../../../products/presentation/view/product_screen.dart';

class CustomCategoryListViewBodyItem extends StatelessWidget {
  final String image;
  final String categoryName;
  final String categoryId;
  const CustomCategoryListViewBodyItem({
    super.key,
    required this.image,
    required this.categoryName,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).extension<MyColors>()!;
    return Card(
      color: myColor.primaryColor!.withValues(alpha: 0.7),
      elevation: 0.3,
      shadowColor: myColor.primaryColor,
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.network(image),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => ProductScreen(
                    category: categoryId,
                    categoryName: categoryName,
                  ),
            ),
          );
        },
        title: Align(
          alignment: AlignmentDirectional.topEnd,
          child: Text(
            categoryName,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
