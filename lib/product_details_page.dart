import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int? selectedSize = 0;

  //because of state class we can use context outside of build context
  void onTap() {
    //add product to cart
    //after add Provider using listen:false to state change
    Provider.of<CartProvider>(context, listen: false)
        .addProduct(widget.product);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   selectedSize = (widget.product['size'] as List<int>)[0];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details', style: Theme.of(context).textTheme.bodySmall),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Image.asset(widget.product['imageUrl'] as String),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(245, 247, 249, 1),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    '\$${widget.product['price']}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 80.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, i) {
                        final size = (widget.product['sizes'] as List<int>)[i];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Chip(
                              label: Text(size.toString()),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              backgroundColor: selectedSize == size
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(double.infinity, 50),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          textStyle: const TextStyle(fontSize: 20.0)),
                      onPressed: () {
                        if (selectedSize != 0) {
                          //set widget product sizes as selected size and add it to the Cart list
                          widget.product['sizes'] = selectedSize as Object;
                          Provider.of<CartProvider>(context, listen: false)
                              .addProduct(widget.product);
                          print(
                              Provider.of<CartProvider>(context, listen: false)
                                  .cart);
                        }
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart_outlined, size: 25.0),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Add To Cart')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
