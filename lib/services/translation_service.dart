// lib/services/translation_service.dart

import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class TranslationService {
  final String apiKey = 'AIzaSyBz6B2iM_72kkfAayOJ0sgVRf4t33m0DdM'; 

  Future<String> translateText(String text, String targetLanguage) async {
    final url = Uri.parse('https://translation.googleapis.com/language/translate/v2?key=$apiKey');

    final response = await http.post(
      url,
      body: json.encode({
        'q': text,
        'target': targetLanguage,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody['data']['translations'][0]['translatedText'];
    } else {
      throw Exception('Failed to translate text');
    }
  }
}
