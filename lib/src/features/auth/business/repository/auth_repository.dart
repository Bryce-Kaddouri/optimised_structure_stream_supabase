import 'package:dartz/dartz.dart';

import '../../../../../core/data/exception/failure.dart';
import '../../data/model/auth_model.dart';

abstract class AuthRepository {
  Future<Either<DatabaseFailure, List<AuthModel>>> getAllAuth();
  Future<Either<DatabaseFailure, bool>> signIn(Map<String, String> param);
  
}
