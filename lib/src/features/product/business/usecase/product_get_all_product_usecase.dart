import 'package:dartz/dartz.dart';

import '../../../../../core/data/exception/failure.dart';
import '../../../../../core/data/usecase/usecase.dart';
import '../../data/model/product_model.dart';
import '../repository/product_repository.dart';

class ProductGetAllProductUsecase extends UseCase<List<ProductModel>, NoParams> {
  final ProductRepository repository;

  ProductGetAllProductUsecase({required this.repository});

  @override
  Future<Either<DatabaseFailure, List<ProductModel>>> call(NoParams params) async {
    return repository.getAllProduct(params);
  }
}
