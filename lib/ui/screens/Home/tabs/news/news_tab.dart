import 'package:flutter/material.dart';
import 'package:news_app/data/apis/api_manager.dart';
import 'package:news_app/data/models/sources_response.dart';
import 'package:news_app/ui/utils/app_colors.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildTabs(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
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
          TabBar(
              isScrollable: true,
              tabs: sourcesList
                  .map((source) => Text(
                        source.name ?? "",
                        style: const TextStyle(color: Colors.black),
                      ))
                  .toList()),
          Expanded(
            child: TabBarView(
                children: sourcesList
                    .map((source) => Container(
                          color: AppColors.primary,
                        ))
                    .toList()),
          )
        ],
      ),
    );
  }
}
