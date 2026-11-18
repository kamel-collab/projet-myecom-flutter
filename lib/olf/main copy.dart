import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String buttonText = "Click me";

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("My App")),

        body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: 20,

          itemBuilder: ( BuildContext context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              elevation: 2,
              child: InkWell(
                onTap: () {
                  print("Carte touchée");
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.teal[100],
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 32,
                          color: Colors.teal,
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Utilisateur Flutter",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            const Text(
                              "Développeur mobile",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 5),

                            const Text(
                              "Disponible",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
   

        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
        ),
      ),
    );
  }
}
