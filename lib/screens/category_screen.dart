import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class CategoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Business',
      'icon': Icons.business,
      'text': S.current.categoryBusiness
    },
    {
      'name': 'Entertainment',
      'icon': Icons.tv,
      'text': S.current.categoryEntertainment
    },
    {
      'name': 'General',
      'icon': Icons.language,
      'text': S.current.categoryGeneral
    },
    {
      'name': 'Health',
      'icon': Icons.health_and_safety,
      'text': S.current.categoryHealth
    },
    {
      'name': 'Science',
      'icon': Icons.science,
      'text': S.current.categoryScience
    },
    {'name': 'Sports', 'icon': Icons.sports, 'text': S.current.categorySports},
    {
      'name': 'Technology',
      'icon': Icons.computer,
      'text': S.current.categoryTechnology
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent, // Un color atractivo para el fondo
        elevation: 10, // Sombra para darle más profundidad
        title: Text(
          S.of(context).categories,
          style: const TextStyle(
            fontSize: 24, // Tamaño de fuente grande para hacerlo más visible
            fontWeight: FontWeight.bold, // Hacerlo más atractivo
            color: Colors.white, // Color blanco para contrastar con el fondo
            letterSpacing: 1.2, // Espaciado entre letras
          ),
        ),
        centerTitle: true, // Centrar el título
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Número de columnas
                crossAxisSpacing: 10, // Espacio horizontal entre las categorías
                mainAxisSpacing: 10, // Espacio vertical entre las categorías
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Card(
                  elevation: 5, // Sombra para dar un efecto de profundidad
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Bordes redondeados
                  ),
                  child: InkWell(
                    onTap: () {
                      // Navegar a la pantalla de noticias con la categoría seleccionada
                      Navigator.pushNamed(context, '/news',
                          arguments: category['name']);
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(category['icon'], size: 40, color: Colors.blue),
                          const SizedBox(
                              height: 10), // Espacio entre el icono y el texto
                          Text(
                            category['text'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Spacer(), // Empuja el contenido hacia la derecha
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/about'); // Navega a la pantalla "Acerca de"
                  },
                  child: Text(
                    S.current.about,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration
                          .underline, // Subrayado para parecer un enlace
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
