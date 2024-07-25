import 'package:flutter/material.dart';
import 'package:group_p2/product.dart';
import 'package:group_p2/checkout.dart';
import 'package:group_p2/cart.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 500,
                height: 500,
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Description: ${product.description}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 25),
              Text(
                'Price: \$${product.price}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckoutScreen(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set background color to black
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
                    ),
                    child: const Text('Checkout'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Cart.addToCart(product); // Add the product to the cart
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Item added to cart.')),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set background color to black
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
                    ),
                    child: const Text('Add to Cart'),
                  ),
                  const SizedBox(width: 20)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}