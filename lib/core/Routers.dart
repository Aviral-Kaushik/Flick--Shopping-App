import 'package:flick/admin_panel/controllers/AdminPanelController.dart';
import 'package:flick/admin_panel/features/adminSettings/AdminSettingsScreen.dart';
import 'package:flick/admin_panel/features/home/AdminPanelHomeScreen.dart';
import 'package:flick/admin_panel/features/messages/MessagesScreen.dart';
import 'package:flick/admin_panel/features/product/screens/add_new_product_screen.dart';
import 'package:flick/admin_panel/features/product/screens/all_prodcuts_screen.dart';
import 'package:flick/admin_panel/features/referral/admin_referral_screen.dart';
import 'package:flick/admin_panel/features/termsAndPrivacy/TermsAndPrivacyAdminScreeen.dart';
import 'package:flick/admin_panel/features/users/UsersListScreen.dart';
import 'package:flick/features/address/screens/add_edit_address_screen.dart';
import 'package:flick/features/address/screens/addresses_screen.dart';
import 'package:flick/features/auth/screens/login_screen.dart';
import 'package:flick/features/auth/screens/register_screen.dart';
import 'package:flick/features/cart/screen/CartScreen.dart';
import 'package:flick/features/contact_us/screens/contact_us.dart';
import 'package:flick/features/home/screen/HomeScreen.dart';
import 'package:flick/features/intro/IntroScreen.dart';
import 'package:flick/features/order/screens/confirmation_screen.dart';
import 'package:flick/features/order/screens/payment_screen.dart';
import 'package:flick/features/order/screens/order_successful_screen.dart';
import 'package:flick/features/product/screens/product_screen.dart';
import 'package:flick/features/profile/screens/profile_home/profile_home.dart';
import 'package:flick/features/referral/screens/referral_screen.dart';
import 'package:flick/features/review/screen/all_reviews_screen.dart';
import 'package:flick/features/settings/screens/settings_screen.dart';
import 'package:flick/features/terms_and_privacy/screens/terms_and_privacy_screen.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/models/pre_order.dart';
import 'package:flick/models/rating.dart';
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
        return MaterialPageRoute(
            builder: (_) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (context) => AdminPanelController(),
                    )
                  ],
                  child: const AdminPanelHomeScreen(),
                ));
      case "/profileHome":
        return MaterialPageRoute(builder: (_) => const ProfileHome());
      case "/adminReferralsScreen":
        return MaterialPageRoute(builder: (_) => const AdminReferralsScreen());
      case "/adminTermsAndCondition":
        return MaterialPageRoute(
            builder: (_) => const TermsAndPrivacyAdminScreen());
      case "/adminPrivacyPolicyScreen":
        return MaterialPageRoute(
            builder: (_) =>
                const TermsAndPrivacyAdminScreen(showUIForPrivacyPolicy: true));
      case "/adminUsersListScreen":
        return MaterialPageRoute(builder: (_) => const UsersListScreen());
      case "/adminMessagesScreen":
        return MaterialPageRoute(builder: (_) => const MessagesScreen());
      case "/adminSettingsScreen":
        return MaterialPageRoute(builder: (_) => const AdminSettingsScreen());
      case "/adminProductsScreen":
        return MaterialPageRoute(builder: (_) => const AllProductsScreen());
      case "/addNewProductScreen":
        return MaterialPageRoute(builder: (_) => const AddNewProductScreen());
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
      case "/contactUs":
        return MaterialPageRoute(builder: (_) => const ContactUs());
      case "/loginScreen":
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case "/registerScreen":
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case "/addressesScreen":
        final args = settings.arguments as Map<String, dynamic>?;
        final preOrder = args?['preOrder'] as PreOrder;
        return MaterialPageRoute(
            builder: (_) => AddressesScreen(
                showUIForSelectAddressScreen:
                    args?['showUIForSelectAddressScreen'] ?? false,
              preOrder: preOrder,));
      case "/addEditAddressScreen":
        final args = settings.arguments as AddEditAddressArguments?;
        return MaterialPageRoute(
            builder: (_) => AddEditAddressScreen(arguments: args));
      case "/productScreen":
        final args = settings.arguments as Product;
        return MaterialPageRoute(builder: (_) => ProductScreen(product: args));
      case "/allReviewsScreen":
        final args = settings.arguments as List<Rating>;
        return MaterialPageRoute(
            builder: (_) => AllReviewsScreen(ratings: args));
      case "/confirmationScreen":
        final args = settings.arguments as Map<String, dynamic>?;
        final preOrder = args?['preOrder'] as PreOrder;
        return MaterialPageRoute(
            builder: (_) => ConfirmationScreen(preOrder: preOrder));
      case "/paymentScreen":
        final args = settings.arguments as Map<String, dynamic>?;
        final preOrder = args?['preOrder'] as PreOrder;
        return MaterialPageRoute(
            builder: (_) => PaymentScreen(preOrder: preOrder));
      case "/orderSuccessfulScreen":
        return MaterialPageRoute(
            builder: (_) => const OrderSuccessfulScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route found for  ${settings.name}')),
                ));
    }
  }
}
