import 'package:flick/core/Routers.dart';
import 'package:flick/core/models/CartItem.dart';
import 'package:flick/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// TODO While Adding Referral part on profile screen add all options that are in
// TODO our list and increment counter when they are pressed
// TODO Implement sharing mail functionality using App Password from link
// TODO https://syedahmedusman2.medium.com/how-to-send-email-from-flutter-application-a1937730d15c

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return ChangeNotifierProvider(
      create: (context) => CartItem(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: IntroScreen(),
        onGenerateRoute: Routers.generateRoute,
        initialRoute: "/introScreen",
      ),
    );
  }
}
