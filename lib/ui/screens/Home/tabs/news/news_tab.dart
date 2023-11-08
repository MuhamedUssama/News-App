import 'package:flutter/material.dart';
import 'package:news_app/data/apis/api_manager.dart';
import 'package:news_app/data/models/sources_response.dart';
import 'package:news_app/ui/screens/Home/tabs/news/article_list.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/utils/app_theme.dart';
import 'package:news_app/ui/widgets/error_widget.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildTabs(snapshot.data!);
          } else if (snapshot.hasError) {
            return BuildErrorWidget(
              height: height * 0.3,
              errorMessage: snapshot.error.toString(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }
        });
  }

  Widget buildTabs(List<Sources> sourcesList) {
    return DefaultTabController(
      length: sourcesList.length,
      child: Column(
        children: [
          const SizedBox(height: 16),
          TabBar(
              onTap: (index) {
                currentTabIndex = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: sourcesList
                  .map((source) => buildTapWidget(source.name ?? "",
                      currentTabIndex == sourcesList.indexOf(source)))
                  .toList()),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              children: sourcesList
                  .map(
                    (source) => ArticleList(),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTapWidget(String name, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? AppColors.primary : AppColors.transparent,
          border: Border.all(color: AppColors.primary, width: 2)),
      child: Text(
        name,
        style: AppTheme.sourcesTab
            .copyWith(color: isSelected ? AppColors.white : AppColors.primary),
      ),
    );
  }
}
