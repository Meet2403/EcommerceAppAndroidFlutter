import 'package:flutter/material.dart';
import 'thank_you.dart';

class CheckoutScreen extends StatelessWidget {

  const CheckoutScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: CheckoutForm(),
        ),
      ),
    );
  }
}

class CheckoutForm extends StatefulWidget {
  const CheckoutForm({Key? key});

  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Full Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email address';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Address'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Card Number'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your card number';
              }
              if (value.length != 16) {
                return 'Card number must be 16 digits long';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'CVV'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your CVV';
              }
              if (value.length != 3) {
                return 'CVV must be 3 digits long';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Expiry (MM/YYYY)'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your card expiry';
              }
              final parts = value.split('/');
              if (parts.length != 2) {
                return 'Invalid expiry date';
              }
              final month = int.tryParse(parts[0]);
              final year = int.tryParse(parts[1]);
              if (month == null || year == null || month < 1 || month > 12 || year < DateTime.now().year) {
                return 'Invalid expiry date';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              if (value.length != 10) {
                return 'Phone number must be 10 digits long';
              }
              return null;
            },
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Item Purchased.')),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThankYouScreen()),
                  ); // Navigate to ThankYouScreen
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set background color to black
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
              ),
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
