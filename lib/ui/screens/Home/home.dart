import 'package:flutter/material.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/ui/screens/Home/tabs/categories/category_tab.dart';
import 'package:news_app/ui/screens/Home/tabs/news/news_tab.dart';
import 'package:news_app/ui/utils/app_assets.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/utils/app_theme.dart';

class HomeDesign extends StatefulWidget {
  static const routeName = "home";
  const HomeDesign({super.key});

  @override
  State<HomeDesign> createState() => _HomeDesignState();
}

class _HomeDesignState extends State<HomeDesign> {
  late Widget currentClick;
  late Widget categoiesTab;

  @override
  void initState() {
    super.initState();

    categoiesTab = CategoryTab(onCategoryClicked: onCategoryClick);
    currentClick = categoiesTab;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        if (currentClick != categoiesTab) {
          currentClick = CategoryTab(onCategoryClicked: onCategoryClick);
          setState(() {});
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text("News App", style: AppTheme.appBarAndCategoriesTitle),
          centerTitle: true,
          backgroundColor: AppColors.primary,
          elevation: 0,
          toolbarHeight: height * 0.085,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.background),
                fit: BoxFit.fill,
              ),
            ),
            child: currentClick),
      ),
    );
  }

  onCategoryClick(CategoryDM categoryDM) {
    currentClick = NewsTab(categoryId: categoryDM.id);
    setState(() {});
  }
}
