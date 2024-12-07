import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    //using Provider inherited widget
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('Cart', style: Theme.of(context).textTheme.bodySmall),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, i) {
            final item = cart[i];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(item['imageUrl'] as String),
                radius: 30,
              ),
              title: Text(item['title'] as String,
                  style: Theme.of(context).textTheme.bodySmall),
              subtitle: Text('Size : ${item['sizes']}'),
              trailing: IconButton(
                  onPressed: () async {
                    await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Delete Product',
                                style: Theme.of(context).textTheme.titleMedium),
                            content: const Text(
                                'Are you sure want to remove the product from cart?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                  child: const Text('No',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold))),
                              TextButton(
                                  onPressed: () {
                                    context
                                        .read<CartProvider>()
                                        .removeProduct(item);
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                  child: const Text('Yes',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold)))
                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.delete, color: Colors.red)),
            );
          }),
    );
  }
}
