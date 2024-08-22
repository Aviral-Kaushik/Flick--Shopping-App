import 'package:firebase_core/firebase_core.dart';
import 'package:flick/core/Routers.dart';
import 'package:flick/core/models/CartItem.dart';
import 'package:flick/data/database/hive_database.dart';
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
  getUserDataFromLocalDatabase();
  runApp(const MyApp());
}

void getUserDataFromLocalDatabase() async {
  debugPrint("Aviral getting user data from local database");
  debugPrint("Aviral Auth().currentUser: ${Auth().currentUser}");
  debugPrint("Aviral Auth().email: ${Auth().currentUser?.email}");
  if (Auth().currentUser != null) {
    debugPrint("Aviral Current User is not null");
    final HiveDatabase hiveDatabase = locator.get<HiveDatabase>();
    // if (Auth().currentUser?.email != null) {
      User? user = await hiveDatabase.getUserData(Auth().currentUser!.email!);
      debugPrint("Aviral User from hive database: $user");
      if (user != null) {
        debugPrint("Aviral User Data is in DB: ${user.toFirestore()}");
      }
    // }
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
