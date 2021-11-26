import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_ecommerce/providers/product_provider.dart';
import 'package:shamo_ecommerce/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    Navigator.pushNamed(context, '/signin');
    // Timer(
    //     Duration(seconds: 3), () => Navigator.of(context).pushNamed('/signin'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: Center(
          child: Container(
        width: 130,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image_splash.png'),
          ),
        ),
      )),
    );
  }
}
