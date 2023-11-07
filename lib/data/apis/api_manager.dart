import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/models/article_response.dart';
import 'package:news_app/data/models/sources_response.dart';

class ApiManager {
  static const String baseUrl = "https://newsapi.org";
  static const String apiKey = "2d5aeba7b893498aae94c7d47aba36cb";

  static Future<List<Sources>> getSources() async {
    const String endPoint = "v2/top-headlines/sources";

    try {
      Uri url = Uri.parse("$baseUrl/$endPoint?apiKey=$apiKey");
      http.Response response = await http.get(url);
      Map json = jsonDecode(response.body);

      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);

      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          sourcesResponse.sources?.isNotEmpty == true) {
        return sourcesResponse.sources!;
      }
      throw Exception(sourcesResponse.message ??
          "There is an error, please try again later");
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Articles>> getArticls(String sourceId) async {
    const String endPoint = "v2/everything";
    try {
      Uri url =
          Uri.https(baseUrl, endPoint, {"apiKey": apiKey, "sources": sourceId});
      http.Response response = await http.get(url);
      Map json = jsonDecode(response.body);

      ArticleResponse articleResponse = ArticleResponse.fromJson(json);

      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          articleResponse.articles!.isNotEmpty == true) {
        return articleResponse.articles!;
      }
      throw Exception(articleResponse.message ??
          "There is an error, please try again later");
    } catch (e) {
      rethrow;
    }
  }
}
