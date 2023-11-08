import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/models/article_response.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/utils/app_theme.dart';
import 'package:news_app/ui/widgets/loading_widget.dart';

class ArticleWidget extends StatelessWidget {
  final Articles articles;

  const ArticleWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              height: height * 0.1,
              imageUrl: articles.urlToImage!,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primary,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 10),
          Text(articles.source!.name ?? "",
              style: AppTheme.sourcesUnderArticle),
          Text(
            articles.title ?? "",
            style: AppTheme.articalText,
          ),
          Text(
            articles.publishedAt ?? "",
            style: AppTheme.timeText,
          )
        ],
      ),
    );
  }
}
