import 'package:flutter/material.dart';
import 'package:shamo_ecommerce/models/cart_model.dart';
import 'package:shamo_ecommerce/services/transaction_service.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> transaction(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      if (await TransactionService().transaction(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('error is ${e}');
      return false;
    }
  }
}
