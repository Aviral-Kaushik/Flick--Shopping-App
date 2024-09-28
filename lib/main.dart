import 'package:firebase_core/firebase_core.dart';
import 'package:flick/core/Routers.dart';
import 'package:flick/core/models/CartItem.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/User.dart';
import 'package:flick/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  setup();
  initUserInstance();
  runApp(const MyApp());
}

// TODO Implement Review Collection with product id to fetch reviews for a product

bool isAdmin = false;

void initUserInstance() async {
  if(Auth().currentUser != null) {
    User? user = await User.instance;
    isAdmin = (user != null) ? user.isAdmin : false;
  } else {
    isAdmin = false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
