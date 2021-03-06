import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_ecommerce/models/product_model.dart';
import 'package:shamo_ecommerce/pages/detail_chat.dart';
import 'package:shamo_ecommerce/providers/cart_provider.dart';
import 'package:shamo_ecommerce/providers/wishlist_provider.dart';
import 'package:shamo_ecommerce/theme.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  ProductPage(this.product);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image_shoes.png',
    'assets/image_shoes2.png',
    'assets/image_shoes3.png',
  ];

  List otherShoes = [
    'assets/image_shoes2.png',
    'assets/image_shoes3.png',
    'assets/image_shoes4.png',
    'assets/image_shoes5.png',
    'assets/image_shoes6.png',
    'assets/image_shoes7.png',
    'assets/image_shoes8.png',
  ];

  // bool isFavorite = false;

  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

    Future<void> showSuccessDialog() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width - (2 * defaultMargin),
              child: AlertDialog(
                backgroundColor: bgColor3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        child: GestureDetector(
                          child: Icon(
                            Icons.close,
                            color: primaryTextColor,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Image.asset('assets/icon_success.png', width: 100),
                      SizedBox(height: 12),
                      Text(
                        'Hurray :)',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Item added successfully',
                        style: secondaryTextStyle,
                      ),
                      SizedBox(height: 12),
                      Container(
                        width: 154,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context).pushNamed('/cart');
                          },
                          child: Text(
                            'View My Cart',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }

    Widget _indicator(int index) {
      return Container(
        width: _currIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _currIndex == index ? primaryColor : Color(0xffC4C4C4),
        ),
      );
    }

    Widget _thumbnailOtherShoes(String img) {
      return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(img, width: 54),
          ),
        ),
      );
    }

    Widget _header() {
      int _index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.chevron_left,
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: bgColor1,
                )
              ],
            ),
          ),
          CarouselSlider(
            items: widget.product.galleries!
                .map((img) => Image.network(
                      img.url.toString(),
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currIndex = index;
                  });
                }),
          ),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.product.galleries!.map((images) {
                _index++;
                return _indicator(_index);
              }).toList()),
        ],
      );
    }

    Widget _content() {
      return Container(
        margin: EdgeInsets.only(top: 17),
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor1,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            Container(
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
                          widget.product.name.toString(),
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          widget.product.category!.name.toString(),
                          style: secondaryTextStyle.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      wishlistProvider.setProduct(widget.product);
                      if (wishlistProvider.isFavorite(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: Text(
                              'Has been added to the wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: Text(
                              'Has been removed from the wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      wishlistProvider.isFavorite(widget.product)
                          ? 'assets/button_wishlist_blue.png'
                          : 'assets/button_wishlist.png',
                      width: 46,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: bgColor2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(height: 12),
                  Text(
                    widget.product.description.toString(),
                    style: secondaryTextStyle.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Familiar Shoes',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: otherShoes.map((img) {
                        return _thumbnailOtherShoes(img);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/detail-chat');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailChatPage(widget.product),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/button_chat.png',
                      width: 54,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          cartProvider.addToCart(widget.product);
                          showSuccessDialog();
                        },
                        child: Text(
                          'Add to Cart',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor7,
      body: ListView(
        children: [
          _header(),
          _content(),
        ],
      ),
    );
  }
}
