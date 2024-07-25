import 'package:flutter/material.dart';
import 'package:group_p2/product.dart';
import 'package:group_p2/checkout.dart'; // Import CheckoutScreen

class Cart {
  static final List<Product> _items = [];

  static List<Product> get items => _items;

  static void addToCart(Product product) {
    _items.add(product);
  }

  static void removeFromCart(Product product) {
    _items.remove(product);
  }

  static void clearCart() {
    _items.clear();
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Cart.items.isEmpty
                ? const Center(
              child: Text('Your cart is empty.'),
            )
                : ListView.builder(
              itemCount: Cart.items.length,
              itemBuilder: (context, index) {
                final product = Cart.items[index];
                return ListTile(
                  leading: Image.asset(
                    product.imagePath,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(product.name),
                  subtitle: Text('Price: \$${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      Cart.removeFromCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Item removed from cart.')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckoutScreen()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set background color to black
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
            ),
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
