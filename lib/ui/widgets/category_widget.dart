import 'package:flutter/material.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/ui/utils/app_theme.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryDM categoryDM;
  const CategoryWidget({super.key, required this.categoryDM});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(8),
      height: height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(25),
          topRight: const Radius.circular(25),
          bottomRight:
              categoryDM.isLeftSided ? const Radius.circular(25) : Radius.zero,
          bottomLeft:
              categoryDM.isLeftSided ? Radius.zero : const Radius.circular(25),
        ),
        color: categoryDM.backgroundColor,
      ),
      child: Column(
        children: [
          Image.asset(
            categoryDM.imagePath,
            height: height * 0.14,
            fit: BoxFit.fill,
          ),
          const Spacer(),
          Text(categoryDM.title, style: AppTheme.appBarAndCategoriesTitle),
          const Spacer(),
        ],
      ),
    );
  }
}
