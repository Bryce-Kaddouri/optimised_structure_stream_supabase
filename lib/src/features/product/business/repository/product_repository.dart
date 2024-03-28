import 'package:dartz/dartz.dart';
import 'package:structure_opti_test_1/core/data/usecase/usecase.dart';

import '../../../../../core/data/exception/failure.dart';
import '../../data/model/product_model.dart';

abstract class ProductRepository {
  Future<Either<DatabaseFailure, List<ProductModel>>> getAllProduct(NoParams params);
  Stream<List<ProductModel>> streamProduct();
}
