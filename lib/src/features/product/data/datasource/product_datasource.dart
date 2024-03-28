import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/data/exception/failure.dart';
import '../model/product_model.dart';

class ProductDataSource {
  final _client = Supabase.instance.client;

  Future<Either<DatabaseFailure, List<ProductModel>>> getAllProduct() async {
    try {
      List<ProductModel> products = [];
      final response = await _client.from('products').select();
      for (var item in response) {
        products.add(ProductModel.fromJson(item));
      }
      return Right(products);
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: e.toString()));
    }
  }

  // stream product
  Stream<List<ProductModel>> streamProduct() {
    return _client.from('products').stream(primaryKey: ['id']).map((event) {
      print(event);
      List<ProductModel> products = [];
      for (var item in event) {
        products.add(ProductModel.fromJson(item));
      }
      return products;
    });
  }
}
