import 'package:dartz/dartz.dart';

import '../../../../../core/data/exception/failure.dart';
import '../../data/model/home_model.dart';

abstract class HomeRepository {
  Future<Either<DatabaseFailure, List<HomeModel>>> getAllHome();
}
