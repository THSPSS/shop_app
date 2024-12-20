import 'package:flutter/material.dart';
import 'package:shop_app_flutter/gloabl_variable.dart';
import 'package:shop_app_flutter/widgets/product_card.dart';

import '../pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'Puma',
    'Reebok',
    'Under Armour'
  ];
  String? selectedFilter;
  //after filtered
  late List<Map<String, Object>> selectedProducts = [];

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    //inherited widget : any changes of all context and it will be rebuild
    //no other than listening size
    //rather mediaQuery using layout builder
    final size = MediaQuery.sizeOf(context);

    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(30.0)),
    );

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 140.0,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Shoes\nCollection',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                const Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  )),
                ),
              ],
            ),
          ),
          //categories
          //using listviewBuilder? or just using for loop?
          SizedBox(
            height: 60.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, i) {
                final filter = filters[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                        selectedProducts = products
                            .where((product) =>
                                product['company'] == selectedFilter)
                            .toList();
                      });
                    },
                    child: Chip(
                      label: Text(filter),
                      labelStyle: const TextStyle(
                        fontSize: 16.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10.0),
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                    ),
                  ),
                );
              },
            ),
          ),
          //layout Builder with constraints (parent widget)
          //rather using mediaQuery , layoutbuilder has more controlle over the responsive UI
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              final items =
                  selectedFilter != 'All' ? selectedProducts : products;

              if (items.isEmpty) {
                return const Center(child: Text('Sorry! There is no item'));
              }
              if (constraints.maxWidth > 1080) {
                return GridView.builder(
                    itemCount: items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.75),
                    itemBuilder: (context, i) {
                      final product = items[i];

                      return GestureDetector(
                        onTap: () {
                          //stacking pages
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'].toString(),
                          price: product['price'] as double,
                          imageUrl: product['imageUrl'].toString(),
                          backgroundColor: i.isOdd
                              ? const Color.fromRGBO(245, 247, 249, 1)
                              : const Color.fromRGBO(216, 240, 253, 1),
                        ),
                      );
                    });
              } else {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    final product = items[i];

                    return GestureDetector(
                      onTap: () {
                        //stacking pages
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsPage(product: product);
                            },
                          ),
                        );
                      },
                      child: ProductCard(
                        title: product['title'].toString(),
                        price: product['price'] as double,
                        imageUrl: product['imageUrl'].toString(),
                        backgroundColor: i.isOdd
                            ? const Color.fromRGBO(245, 247, 249, 1)
                            : const Color.fromRGBO(216, 240, 253, 1),
                      ),
                    );
                  },
                );
              }
            }),
          ),
          // Expanded(
          //   child: GridView.builder(
          //       itemCount: products.length,
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: size.width > 650 ? 2 : 1,
          //           childAspectRatio: size.width > 650 ? 2 : 1),
          //       itemBuilder: (context, i) {
          //         final product = products[i];

          //         return GestureDetector(
          //           onTap: () {
          //             //stacking pages
          //             Navigator.of(context).push(
          //               MaterialPageRoute(
          //                 builder: (context) {
          //                   return ProductDetailsPage(product: product);
          //                 },
          //               ),
          //             );
          //           },
          //           child: ProductCard(
          //             title: product['title'].toString(),
          //             price: product['price'] as double,
          //             imageUrl: product['imageUrl'].toString(),
          //             backgroundColor: i.isOdd
          //                 ? const Color.fromRGBO(245, 247, 249, 1)
          //                 : const Color.fromRGBO(216, 240, 253, 1),
          //           ),
          //         );
          //       }),
          // )
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: products.length,
          //     itemBuilder: (context, i) {
          //       final product = products[i];

          //       return GestureDetector(
          //         onTap: () {
          //           //stacking pages
          //           Navigator.of(context).push(
          //             MaterialPageRoute(
          //               builder: (context) {
          //                 return ProductDetailsPage(product: product);
          //               },
          //             ),
          //           );
          //         },
          //         child: ProductCard(
          //           title: product['title'].toString(),
          //           price: product['price'] as double,
          //           imageUrl: product['imageUrl'].toString(),
          //           backgroundColor: i.isOdd
          //               ? const Color.fromRGBO(245, 247, 249, 1)
          //               : const Color.fromRGBO(216, 240, 253, 1),
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
