import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // AppBar
      appBar: AppBar(
        title: Text(
          'My E-Commerce',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 4.0,
      ),

      // Grille responsive des produits
      body: LayoutBuilder(
        builder: (context, constraints) {

          // Largeur approximative souhaitée pour chaque carte
          double cardWidth = 180.0;

          // Calcul dynamique du nombre de colonnes
          int crossAxisCount =
              (constraints.maxWidth / cardWidth).floor();

          // On s'assure d'avoir au moins 2 colonnes
          if (crossAxisCount < 2) {
            crossAxisCount = 2;
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),

            child: GridView.builder(
              itemCount: 12,

              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.9,
              ),

              itemBuilder: (context, index) {
                return ProductCard(
                  name: 'Futuristic T-Shirt #${index + 1}',
                  price: '${(index + 1) * 10} \$',

                  imageUrl:
                      'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',

                  onTap: () {
                    print('Produit ${index + 1} cliqué !');
                  },
                );
              },
            ),
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
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}