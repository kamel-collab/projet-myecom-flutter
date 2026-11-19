import 'package:flutter/material.dart';

import '../widgets/product_card.dart';
import '../services/api_service.dart';
import 'detail_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text(
          'My E-Commerce',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 4.0,
      ),

      // Chargement des produits depuis l'API
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchProductsFromApi(),

        builder: (context, snapshot) {
          // 1. Chargement
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Erreur
          if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          }

          // 3. Aucun produit disponible
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun produit disponible'));
          }

          // 4. Données disponibles
          final products = snapshot.data!;

          return LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth = 180.0;

              int crossAxisCount = (constraints.maxWidth / cardWidth).floor();

              if (crossAxisCount < 2) {
                crossAxisCount = 2;
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),

                child: GridView.builder(
                  // Nombre de produits retournés par l'API
                  itemCount: products.length,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 0.65,
                  ),

                  itemBuilder: (context, index) {
                    // Récupérer le produit actuel
                    final product = products[index];

                    return ProductCard(
                      name: product['name'],
                      price: product['price'],
                      imageUrl: product['imageUrl'],

                      // Navigation vers DetailScreen
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          DetailScreen.routeName,

                          // Envoyer toutes les données du produit
                          arguments: product,
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),

      // BottomNavigationBar
      bottomNavigationBar: bottomNav(),
    );
  }

  BottomNavigationBar bottomNav() {
    return BottomNavigationBar(
      currentIndex: 0,
      backgroundColor: Colors.deepOrange,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
