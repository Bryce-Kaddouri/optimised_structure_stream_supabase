import 'package:dartz/dartz.dart';
import 'package:structure_opti_test_1/core/data/usecase/usecase.dart';

import '../../../../../core/data/exception/failure.dart';
import '../../business/repository/product_repository.dart';
import '../datasource/product_datasource.dart';
import '../model/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource dataSource;

  ProductRepositoryImpl({required this.dataSource});

  @override
  Future<Either<DatabaseFailure, List<ProductModel>>> getAllProduct(NoParams params) async {
    return dataSource.getAllProduct();
  }

  @override
  Stream<List<ProductModel>> streamProduct() {
    return dataSource.streamProduct();
  }
}
