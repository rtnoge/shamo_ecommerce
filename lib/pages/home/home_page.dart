import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_ecommerce/models/user_model.dart';
import 'package:shamo_ecommerce/providers/auth_provider.dart';
import 'package:shamo_ecommerce/providers/product_provider.dart';
import 'package:shamo_ecommerce/widgets/product_card.dart';
import 'package:shamo_ecommerce/widgets/product_tile.dart';
import 'package:shamo_ecommerce/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel userModel = authProvider.userModel;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget _header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${userModel.name}',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    '@${userModel.username}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  // image: AssetImage('assets/image_profile.png'),
                  image: NetworkImage(userModel.urlPhoto.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _categories() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                ),
                child: Text(
                  'All Shoes',
                  style: primaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: bgColor4,
                    width: 1,
                  ),
                  color: transparent,
                ),
                child: Text(
                  'Running',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: bgColor4,
                    width: 1,
                  ),
                  color: transparent,
                ),
                child: Text(
                  'Training',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: bgColor4,
                    width: 1,
                  ),
                  color: transparent,
                ),
                child: Text(
                  'Basketball',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: bgColor4,
                    width: 1,
                  ),
                  color: transparent,
                ),
                child: Text(
                  'Hiking',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              SizedBox(width: defaultMargin),
            ],
          ),
        ),
      );
    }

    Widget _popularTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Popular Products',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget _newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'New Arrivals',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget _newArrivals() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: productProvider.products
              .map((product) => ProductTile(product))
              .toList(),
        ),
      );
    }

    Widget _popularProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: defaultMargin),
                  Row(
                    children: productProvider.products
                        .map((product) => ProductCard(product))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        _header(),
        _categories(),
        _popularTitle(),
        _popularProducts(),
        _newArrivalsTitle(),
        _newArrivals(),
      ],
    );
  }
}
