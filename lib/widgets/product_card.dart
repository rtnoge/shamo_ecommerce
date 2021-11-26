import 'package:flutter/material.dart';
import 'package:shamo_ecommerce/models/product_model.dart';
import 'package:shamo_ecommerce/pages/product_page.dart';
import 'package:shamo_ecommerce/theme.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(product)));
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: primaryTextColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: defaultMargin),
            Image.network(
              product.galleries![0].url.toString(),
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category!.name.toString(),
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    product.name.toString(),
                    style: productCardTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 6),
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
