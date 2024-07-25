import 'package:flutter/material.dart';
import 'package:group_p2/product_details.dart';
import 'package:group_p2/cart.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final List<Product> products = [
    Product(
      name: 'Vintage Shirt',
      description: 'Classic vintage shirt',
      price: 29.99,
      imagePath: 'assets/shirt.png',
    ),
    Product(
      name: 'Vintage Dress',
      description: 'Elegant vintage dress',
      price: 49.99,
      imagePath: 'assets/dress.png',
    ),
    Product(
      name: 'Vintage Jeans',
      description: 'Stylish vintage jeans',
      price: 39.99,
      imagePath: 'assets/jeans.png',
    ),
    Product(
      name: 'Vintage Handbag',
      description: 'Chic vintage handbag',
      price: 59.99,
      imagePath: 'assets/handbag.png',
    ),
    Product(
      name: 'Vintage Watch',
      description: 'Timeless vintage watch',
      price: 99.99,
      imagePath: 'assets/watch.png',
    ),
    Product(
      name: 'Vintage Shoes',
      description: 'Fashionable vintage shoes',
      price: 79.99,
      imagePath: 'assets/shoes.png',
    ),
    Product(
      name: 'Vintage Hat',
      description: 'Classy vintage hat',
      price: 19.99,
      imagePath: 'assets/hat.png',
    ),
    Product(
      name: 'Vintage Jacket',
      description: 'Trendy vintage jacket',
      price: 69.99,
      imagePath: 'assets/jacket.png',
    ),
    Product(
      name: 'Vintage Skirt',
      description: 'Charming vintage skirt',
      price: 39.99,
      imagePath: 'assets/skirt.png',
    ),
    Product(
      name: 'Vintage Bag',
      description: 'Vintage bag for everyday use',
      price: 49.99,
      imagePath: 'assets/bag.png',
    ),
    Product(
      name: 'Vintage Sunglasses',
      description: 'Retro sunglasses for a cool look',
      price: 29.99,
      imagePath: 'assets/sunglasses.png',
    ),
    Product(
      name: 'Vintage Sweater',
      description: 'Cozy vintage sweater for cold days',
      price: 59.99,
      imagePath: 'assets/sweater.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vintage Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: products[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text(products[index].name),
                  subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
                  leading: Image.asset(
                    products[index].imagePath,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}
