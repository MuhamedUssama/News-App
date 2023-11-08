import 'package:flutter/material.dart';
import 'package:news_app/data/apis/api_manager.dart';
import 'package:news_app/data/models/article_response.dart';
import 'package:news_app/data/models/sources_response.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/widgets/article_widget.dart';
import 'package:news_app/ui/widgets/error_widget.dart';

class ArticleList extends StatelessWidget {
  final Sources sources;
  const ArticleList({super.key, required this.sources});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: ApiManager.getArticls(sources.id!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildArticleList(snapshot.data!.toList());
          } else if (snapshot.hasError) {
            return BuildErrorWidget(
              height: height * 0.3,
              errorMessage: snapshot.error.toString(),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.primary,
            ));
          }
        });
  }

  Widget buildArticleList(List<Articles> articles) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleWidget(articles: articles[index]);
        });
  }
}
