import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_ecommerce/pages/home/chat_page.dart';
import 'package:shamo_ecommerce/pages/home/home_page.dart';
import 'package:shamo_ecommerce/pages/home/profile_page.dart';
import 'package:shamo_ecommerce/pages/home/wishlist_page.dart';
import 'package:shamo_ecommerce/providers/page_provider.dart';
import 'package:shamo_ecommerce/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget _cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        child: Image.asset('assets/icon_cart.png', width: 20, height: 20),
        backgroundColor: secondaryColor,
      );
    }

    Widget _customButtonNavbar() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: bgColor6,
              type: BottomNavigationBarType.fixed,
              currentIndex: pageProvider.currentIndex,
              onTap: (value) {
                print(value);
                setState(() {
                  pageProvider.currentIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/icon_home.png',
                      width: 21,
                      color: pageProvider.currentIndex == 0
                          ? primaryColor
                          : Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_chat.png',
                        width: 20,
                        color: pageProvider.currentIndex == 1
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_wishlist.png',
                        width: 20,
                        color: pageProvider.currentIndex == 2
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_profile.png',
                        width: 18,
                        color: pageProvider.currentIndex == 3
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: ''),
              ]),
        ),
      );
    }

    Widget _body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return ChatPage();
        case 2:
          return WishlistPage();
        case 3:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: pageProvider.currentIndex == 0 ? bgColor1 : bgColor3,
      floatingActionButton: _cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _customButtonNavbar(),
      body: Center(
        child: _body(),
      ),
    );
  }
}
