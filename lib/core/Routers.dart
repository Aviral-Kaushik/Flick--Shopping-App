import 'package:flick/admin_panel/controllers/AdminPanelController.dart';
import 'package:flick/admin_panel/features/adminSettings/AdminSettingsScreen.dart';
import 'package:flick/admin_panel/features/home/AdminPanelHomeScreen.dart';
import 'package:flick/admin_panel/features/messages/MessagesScreen.dart';
import 'package:flick/admin_panel/features/referral/admin_referral_screen.dart';
import 'package:flick/admin_panel/features/termsAndPrivacy/TermsAndPrivacyAdminScreeen.dart';
import 'package:flick/admin_panel/features/users/UsersListScreen.dart';
import 'package:flick/features/cart/screen/CartScreen.dart';
import 'package:flick/features/home/screen/HomeScreen.dart';
import 'package:flick/features/intro/IntroScreen.dart';
import 'package:flick/features/profile/screens/profile_home/profile_home.dart';
import 'package:flick/features/referral/screens/referral_screen.dart';
import 'package:flick/features/settings/screens/settings_screen.dart';
import 'package:flick/features/terms_and_privacy/screens/terms_and_privacy_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/introScreen":
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case "/homeScreen":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "/cartScreen":
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case "/shopScreen":
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case "/adminPanel":
        return MaterialPageRoute(builder: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => AdminPanelController(),)
            ],
            child: const AdminPanelHomeScreen(),
          ));
      case "/profileHome":
        return MaterialPageRoute(builder: (_) => const ProfileHome());
      case "/adminReferralsScreen":
        return MaterialPageRoute(builder: (_) => const AdminReferralsScreen());
      case "/adminTermsAndCondition":
        return MaterialPageRoute(builder: (_) => const TermsAndPrivacyAdminScreen());
      case "/adminPrivacyPolicyScreen":
        return MaterialPageRoute(builder: (_) => const TermsAndPrivacyAdminScreen(showUIForPrivacyPolicy: true));
      case "/adminUsersListScreen":
        return MaterialPageRoute(builder: (_) => const UsersListScreen());
      case "/adminMessagesScreen":
        return MaterialPageRoute(builder: (_) => const MessagesScreen());
      case "/adminSettingsScreen":
        return MaterialPageRoute(builder: (_) => const AdminSettingsScreen());
      case "/termsAndConditions":
        return MaterialPageRoute(builder: (_) => const TermsAndPrivacyScreen());
      case "/privacyPolicy":
        return MaterialPageRoute(
            builder: (_) =>
                const TermsAndPrivacyScreen(showUiForPrivacyPolicy: true));
      case "/settingsScreen":
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case "/referralScreen":
        return MaterialPageRoute(builder: (_) => const ReferralScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route found for  ${settings.name}')),
                ));
    }
  }
}
