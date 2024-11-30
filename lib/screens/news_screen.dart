import 'package:flutter/material.dart';
import '../services/news_service.dart';
import '../models/article.dart';
import '../services/translation_service.dart';
import 'dart:math'; // Importar para generar números aleatorios
import '../generated/l10n.dart';

class NewsScreen extends StatelessWidget {
  final NewsService newsService;
  final TranslationService translationService =
      TranslationService(); // Instancia del servicio de traducción

  NewsScreen({super.key, required this.newsService, required String category});

  @override
  Widget build(BuildContext context) {
    // Obtenemos la categoría seleccionada desde los argumentos
    final String category = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).news),
      ),
      body: FutureBuilder<List<Article>>(
        future: newsService.fetchNewsByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No news available for this category'));
          } else {
            final articles = snapshot.data!;

            // Print para inspeccionar las noticias sin traducir
            print('Fetched articles:');
            for (var article in articles) {
              print('Title: ${article.title}');
              print('Image URL: ${article.urlToImage}');
            }

            return FutureBuilder<List<Article>>(
              future: _translateArticles(context, articles), // Pasamos el context
              builder: (context, translationSnapshot) {
                if (translationSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (translationSnapshot.hasError) {
                  return Center(
                      child: Text('Error: ${translationSnapshot.error}'));
                } else if (!translationSnapshot.hasData ||
                    translationSnapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('No translated news available'));
                } else {
                  final translatedArticles = translationSnapshot.data!;
                  return ListView.builder(
                    itemCount: translatedArticles.length,
                    itemBuilder: (context, index) {
                      final article = translatedArticles[index];
                      return _buildNewsCard(article);
                    },
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  //Funcion para traducir
  Future<List<Article>> _translateArticles(
      BuildContext context, List<Article> articles) async {
    List<Article> translatedArticles = [];

    // Obtén el idioma actual de la aplicación
    String currentLanguage = Localizations.localeOf(context).languageCode;

    for (var article in articles) {
      // Si el idioma es español, traducimos
      if (currentLanguage == 'es') {
        final translatedTitle = await translationService.translateText(
            article.title, 'es'); 
        final translatedDescription = await translationService.translateText(
            article.description, 'es'); 

        translatedArticles.add(Article(
          title: translatedTitle,
          description: translatedDescription,
          url: article.url,
          urlToImage: article.urlToImage,
        ));
      } else {
        translatedArticles.add(Article(
          title: article.title,
          description: article.description,
          url: article.url,
          urlToImage: article.urlToImage,
        ));
      }
    }

    return translatedArticles;
  }

  // Función para construir una tarjeta estilizada para cada artículo
  Widget _buildNewsCard(Article article) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen de la noticia o ícono si no hay imagen
          article.urlToImage.isNotEmpty
              ? ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ?? 1)
                                    : null
                                : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      // Imprimir el error
                      print("Error loading image: $error");
                      print("Stack trace: $stackTrace");

                      return _getRandomLocalImage(); // Mostrar imagen local en caso de error
                    },
                  ),
                )
              : _getRandomLocalImage(), // Mostrar imagen local si no hay URL de imagen

          // Título
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),

          // Descripción
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // Función para obtener una imagen local aleatoria
  Widget _getRandomLocalImage() {
    final random = Random();
    final imageNumber = random.nextInt(14) + 1; // Genera un número entre 1 y 14
    final imagePath = 'assets/images/$imageNumber.jpg'; // Cambié la ruta a 'assets/'

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 200,
      ),
    );
  }
}
