import 'package:flutter/material.dart';
import 'package:group_p2/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vintage Shopping',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
          accentColor: Colors.grey,
        ),
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/product': (context) => ProductScreen(),
      },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vintage Shopping'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/home_page.jpeg',
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/product');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set background color to black
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
              ),
              child: const Text('Explore Vintage Collection'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Helee Kakdiya-8899205',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Meet Kadiya-8899079',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}