import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class OrderSuccessfulScreen extends StatefulWidget {
  const OrderSuccessfulScreen({super.key});

  @override
  State<OrderSuccessfulScreen> createState() => _OrderSuccessfulScreenState();
}

class _OrderSuccessfulScreenState extends State<OrderSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Column(
            children: [

              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.greenAccent,
                    ),

                    child: Column(),
                  )
              ),

              Expanded(flex: 1, child: Container()),

            ],
          ),
        ),
      ),
    );
  }
}
