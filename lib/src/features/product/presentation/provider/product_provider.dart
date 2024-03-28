import 'package:flutter/material.dart';
import 'package:structure_opti_test_1/core/data/usecase/usecase.dart';

import '../../business/usecase/product_get_all_product_usecase.dart';
import '../../business/usecase/product_stream_all_product_usecase.dart';
import '../../data/model/product_model.dart';

class ProductProvider with ChangeNotifier {
  final ProductGetAllProductUsecase getAllProductUsecase;
  final ProductStreamAllProductUsecase productStreamAllProductUsecase;
  ProductProvider({
    required this.getAllProductUsecase,
    required this.productStreamAllProductUsecase,
  });
  Future<List<ProductModel>?> getAllProduct(NoParams param) async {
    getAllProductUsecase.call(param).then((value) {
      value.fold((l) {
        print(l.errorMessage);
      }, (r) {
        // do something with the result
      });
    });
  }

  Stream<List<ProductModel>> streamProduct(NoParams param) {
    return productStreamAllProductUsecase.call(param);
  }

  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;
  set productList(List<ProductModel> value) {
    _productList = value;
    notifyListeners();
  }

  void init() {
    streamProduct(NoParams()).listen((event) {
      productList = event;
    });
  }
}
