import 'package:flutter/material.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/ui/utils/app_theme.dart';
import 'package:news_app/ui/widgets/category_widget.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.03),
          const Text(
            "Pick your category \nof interest",
            style: AppTheme.categoryHead,
          ),
          SizedBox(height: height * 0.03),
          Expanded(
            child: GridView.builder(
                itemCount: CategoryDM.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: width * 0.05,
                    mainAxisSpacing: height * 0.02),
                itemBuilder: (context, index) {
                  return CategoryWidget(
                    categoryDM: CategoryDM.categories[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
