import 'package:api_noticias/screens/about_screen.dart';
import 'package:flutter/material.dart';
import 'services/news_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/splash_screen.dart';
import 'screens/category_screen.dart'; // Importamos la nueva pantalla
import 'screens/news_screen.dart'; // Importamos la pantalla para mostrar noticias por categoría
import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NewsService _newsService = NewsService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News Api',
        initialRoute: '/', // Ruta inicial al Splash Screen
        routes: {
          '/': (context) => SplashScreen(), // Ruta inicial al Splash Screen
          '/categories': (context) =>
              CategoryScreen(), // Ruta a la pantalla de categorías
          '/news': (context) => NewsScreen(
                newsService: _newsService,
                category: '',
              ), // Ruta a la pantalla de noticias por categoría
          '/about': (context) => AboutScreen(),
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate
        ],
        supportedLocales: S.delegate.supportedLocales);
  }
}
