import 'package:flick/admin_panel/components/drawerMenu/AdminDrawerMenu.dart';
import 'package:flick/admin_panel/components/messagesScreen/MessagesScreenContent.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgColor,
      drawer: AdminDrawerMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: MessagesScreenContent())
            ],
          ),
        ),
      ),
    );
  }
}
