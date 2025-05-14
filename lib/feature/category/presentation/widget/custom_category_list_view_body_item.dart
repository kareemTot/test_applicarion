import 'package:flutter/material.dart';
import 'package:test_applicarion/feature/category/presentation/theme/category_them.dart';
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
    final category = Theme.of(context).extension<CategoryTheme>()!;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: category.horizontalPadding!,
        vertical: category.verticalPadding!,
      ),
      margin: EdgeInsets.only(bottom: category.margin!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(category.borderRadius!),
        color: category.backgroundColor,
      ),
      child: ListTile(
        leading: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(category.imageRadius!),
          ),
          padding: EdgeInsets.symmetric(vertical: category.verticalPadding!),
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
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: category.textColor,
              fontSize: category.fontSize,
              fontWeight: category.fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
