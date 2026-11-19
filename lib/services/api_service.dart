import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchProductsFromApi() async {

  // Envoyer une requête GET à l'API
  final response = await http.get(
    Uri.parse('https://fakestoreapi.com/products'),
  ).timeout(
    const Duration(seconds: 15),
  );

  // Vérifier si la requête a réussi
  if (response.statusCode == 200) {

    // Convertir le JSON en liste Dart
    final List<dynamic> data = jsonDecode(response.body);

    // Transformer les produits pour notre application
    return data.map((item) {

      final product = item as Map<String, dynamic>;

      return <String, dynamic>{
        'name': product['title'],
        'price': '${product['price']} \$',
        'imageUrl': product['image'],
        'rating': (product['rating']['rate'] as num).round(),
      };

    }).toList();

  } else {

    // Erreur HTTP
    throw Exception(
      'Erreur lors du chargement : ${response.statusCode}',
    );
  }
}