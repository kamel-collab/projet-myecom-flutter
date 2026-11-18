import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My E-Commerce',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 4.0,
      ),

      // Affichage de notre ProductCard
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductCard(
            name: 'Futuristic T-Shirt',
            price: '29.99 \$',
            imageUrl:
                'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png',
            onTap: () {
              print("Produit cliqué !");
            },
          ),
        ),
      ),

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