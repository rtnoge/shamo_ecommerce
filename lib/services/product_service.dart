import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo_ecommerce/models/product_model.dart';

class ProductService {
  String baseUrl = 'YOUR-API-HERE';

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var header = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: header);

    print('kumpulan data product: ${response.body}');

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> listProducts = [];

      for (var item in data) {
        listProducts.add(ProductModel.fromJson(item));
      }

      return listProducts;
    } else {
      throw Exception('Failed to load product');
    }
  }
}
