import 'package:firebase_core/firebase_core.dart';
import 'package:flick/core/Routers.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/models/User.dart';
import 'package:flick/models/order_product.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flick/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/adapters.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  registerHiveAdapters();
  setup();
  initUserInstance();

  Stripe.publishableKey = stripePublishableKey;

  runApp(const MyApp());
}

bool isAdmin = false;

void initUserInstance() async {
  if(Auth().currentUser != null) {
    User? user = await User.instance;
    isAdmin = (user != null) ? user.isAdmin : false;
  } else {
    isAdmin = false;
  }
}

void registerHiveAdapters() {
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(OrderProductAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: IntroScreen(),
      onGenerateRoute: Routers.generateRoute,
      initialRoute: "/introScreen",
    );
  }
}
