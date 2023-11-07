import 'package:flutter/material.dart';
import 'package:news_app/data/apis/api_manager.dart';

class HomeDesign extends StatefulWidget {
  static const routeName = "home";
  const HomeDesign({super.key});

  @override
  State<HomeDesign> createState() => _HomeDesignState();
}

class _HomeDesignState extends State<HomeDesign> {
  @override
  Widget build(BuildContext context) {
    ApiManager.getSources();
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
