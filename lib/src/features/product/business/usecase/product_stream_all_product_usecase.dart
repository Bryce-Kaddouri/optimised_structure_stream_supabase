import '../../../../../core/data/usecase/usecase.dart';
import '../../data/model/product_model.dart';
import '../repository/product_repository.dart';

class ProductStreamAllProductUsecase extends StreamUseCase<List<ProductModel>, NoParams> {
  final ProductRepository repository;

  ProductStreamAllProductUsecase({required this.repository});

  @override
  Stream<List<ProductModel>> call(NoParams params) {
    return repository.streamProduct();
  }
}
