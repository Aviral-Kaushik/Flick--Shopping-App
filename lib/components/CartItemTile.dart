import 'package:flick/models/Product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class CartItemTile extends StatefulWidget {
  final Product product;
  final void Function()? onDeletePressed;

  const CartItemTile({super.key, required this.product, required this.onDeletePressed});

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: shoppingCardBackground,
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 10.0),

      child: ListTile(
        leading: Image.asset(widget.product.productImages[0]),
        title: Text(widget.product.productName),
        subtitle: Text("${widget.product.productPrice}"),
        trailing: IconButton(icon: const Icon(Icons.delete), onPressed: widget.onDeletePressed),
      ),
    );
  }
}
