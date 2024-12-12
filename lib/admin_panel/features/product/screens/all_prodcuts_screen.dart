import 'package:flick/admin_panel/components/drawerMenu/AdminDrawerMenu.dart';
import 'package:flick/admin_panel/components/products/all_products_list_content.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const AdminDrawerMenu(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appPadding * 2),
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/addNewProductScreen");
        },
        child: Icon(
          Icons.add,
          size: 25,
          color: whiteColor,
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AllProductsListContent(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
