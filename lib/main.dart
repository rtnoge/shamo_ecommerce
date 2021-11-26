import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_ecommerce/pages/cart_page.dart';
import 'package:shamo_ecommerce/pages/checkout_page.dart';
import 'package:shamo_ecommerce/pages/checkout_success.dart';
// import 'package:shamo_ecommerce/pages/detail_chat.dart';
import 'package:shamo_ecommerce/pages/edit_profile.dart';
import 'package:shamo_ecommerce/pages/home/main_page.dart';
import 'package:shamo_ecommerce/pages/sign_in.dart';
import 'package:shamo_ecommerce/pages/sign_up.dart';
import 'package:shamo_ecommerce/pages/splash_screen.dart';
import 'package:shamo_ecommerce/providers/auth_provider.dart';
import 'package:shamo_ecommerce/providers/cart_provider.dart';
import 'package:shamo_ecommerce/providers/page_provider.dart';
import 'package:shamo_ecommerce/providers/product_provider.dart';
import 'package:shamo_ecommerce/providers/transaction_provider.dart';
import 'package:shamo_ecommerce/providers/wishlist_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
        ChangeNotifierProvider(create: (context) => PageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/signin': (context) => SignIn(),
          '/signup': (context) => SignUp(),
          '/home': (context) => MainPage(),
          // '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccess(),
        },
        // home: SplashScreen(),
      ),
    );
  }
}
