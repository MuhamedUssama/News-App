import 'package:flutter/material.dart';
import 'package:news_app/ui/utils/app_assets.dart';

class CategoryDM {
  String id;
  String title;
  String imagePath;
  bool isLeftSided;
  Color backgroundColor;

  CategoryDM(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.isLeftSided,
      required this.backgroundColor});

  static List<CategoryDM> categories = [
    CategoryDM(
        id: "sports",
        title: "Sports",
        imagePath: AppAssets.sportCategory,
        isLeftSided: true,
        backgroundColor: Colors.red[900]!),
    CategoryDM(
        id: "technology",
        title: "Technology",
        imagePath: AppAssets.technologyCategory,
        isLeftSided: false,
        backgroundColor: Colors.blue[900]!),
    CategoryDM(
        id: "health",
        title: "Health",
        imagePath: AppAssets.healthCategory,
        isLeftSided: true,
        backgroundColor: Colors.pink),
    CategoryDM(
        id: "business",
        title: "Business",
        imagePath: AppAssets.bussinesCategory,
        isLeftSided: false,
        backgroundColor: Colors.orange[900]!),
    CategoryDM(
        id: "entertainment",
        title: "Entertainment",
        imagePath: AppAssets.entertainmentCategory,
        isLeftSided: true,
        backgroundColor: Colors.lightBlue),
    CategoryDM(
        id: "science",
        title: "Science",
        imagePath: AppAssets.scienceCategory,
        isLeftSided: false,
        backgroundColor: Colors.yellow[500]!)
  ];
}
