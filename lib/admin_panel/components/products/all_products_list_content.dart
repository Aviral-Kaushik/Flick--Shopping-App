import 'package:flutter/material.dart';

class AllProductsListContent extends StatefulWidget {
  const AllProductsListContent({super.key});

  @override
  State<AllProductsListContent> createState() => _AllProductsListContentState();
}

class _AllProductsListContentState extends State<AllProductsListContent> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Center(child: Text("All Products List Content")));
  }
}
