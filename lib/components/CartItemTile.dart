import 'package:flick/core/models/ShoppingItem.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class CartItemTile extends StatefulWidget {
  final ShoppingItem cartItem;
  final void Function()? onDeletePressed;

  const CartItemTile({super.key, required this.cartItem, required this.onDeletePressed});

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
        leading: Image.asset(widget.cartItem.imagePath),
        title: Text(widget.cartItem.name),
        subtitle: Text(widget.cartItem.price),
        trailing: IconButton(icon: const Icon(Icons.delete), onPressed: widget.onDeletePressed),
      ),
    );
  }
}
