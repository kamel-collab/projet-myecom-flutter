import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Récupération des informations envoyées
    final product = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final int rating = product['rating'] as int? ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product['name'],
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // Image du produit avec une hauteur fixe
            Image.network(
              product['imageUrl'],
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),

            // Nom du produit
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product['name'],
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // Prix du produit et Rating
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),

              child: Row(
                children: [

                  Text(
                    product['price'],
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Rating stars
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 24,
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Titre de la description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Description du produit",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Ceci est une description détaillée du produit. "
                "Vous pouvez y ajouter toutes les informations "
                "nécessaires pour informer l'utilisateur sur "
                "le produit.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Bouton Ajouter au Panier
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Produit ajouté au panier !",
                      ),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),

                child: const Text("Ajouter au Panier"),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}