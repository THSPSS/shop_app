import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;
  final Color backgroundColor;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toString(),
              style: Theme.of(context).textTheme.titleMedium),
          Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
          Center(
            child: Image.asset(
              imageUrl,
              width: 300,
            ),
          )
        ],
      ),
    );
  }
}
