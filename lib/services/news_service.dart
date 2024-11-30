import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/article.dart';

class NewsService {
  final String apiKey = '5315cf0d12e14db1ba8d36163f55fb62'; 
  Future<List<Article>> fetchTopHeadlines() async {
    final url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Article> articles = (data['articles'] as List)
          .map((article) => Article.fromJson(article))
          .toList();
      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<Article>> fetchNewsByCategory(String category) async {
    final url = 'https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Article> articles = (data['articles'] as List)
          .map((article) => Article.fromJson(article))
          .toList();
      return articles;
    } else {
      throw Exception('Failed to load news by category');
    }
  }
}
