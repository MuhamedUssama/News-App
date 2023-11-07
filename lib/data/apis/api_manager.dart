import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/models/sources_response.dart';

class ApiManager {
  static getSources() async {
    const String baseUrl = "https://newsapi.org";
    const String endPoint = "v2/top-headlines/sources";
    const String apiKey = "2d5aeba7b893498aae94c7d47aba36cb";

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
      throw Exception(
          sourcesResponse.message ?? "There is an error, please try again");
    } catch (e) {
      rethrow;
    }
  }

  void getArticls() {}
}
