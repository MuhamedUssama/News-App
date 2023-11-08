import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/models/article_response.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/utils/app_theme.dart';

class ArticleWidget extends StatelessWidget {
  final Articles articles;

  const ArticleWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              height: height * 0.26,
              imageUrl: articles.urlToImage!,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primary,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: height * 0.02),
          Text(articles.source!.name ?? "",
              style: AppTheme.sourcesUnderArticle),
          SizedBox(height: height * 0.01),
          Text(
            articles.title ?? "",
            style: AppTheme.articalText,
          ),
          SizedBox(height: height * 0.01),
          Text(
            articles.publishedAt ?? "",
            style: AppTheme.timeText,
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}
