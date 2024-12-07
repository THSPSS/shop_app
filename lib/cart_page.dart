import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

import 'gloabl_variable.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    //using Provider inherited widget
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('Cart', style: Theme.of(context).textTheme.bodySmall),
      ),
      body: ListView.builder(
          itemCount:
              Provider.of<CartProvider>(context, listen: false).cart.length,
          itemBuilder: (context, i) {
            final item =
                Provider.of<CartProvider>(context, listen: false).cart[i];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(item['imageUrl'] as String),
                radius: 30,
              ),
              title: Text(item['title'] as String,
                  style: Theme.of(context).textTheme.bodySmall),
              subtitle: Text('Size : ${item['sizes']}'),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      cart.removeAt(i);
                    });
                  },
                  icon: const Icon(Icons.delete, color: Colors.red)),
            );
          }),
    );
  }
}
