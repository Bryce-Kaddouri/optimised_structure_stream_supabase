import 'package:dartz/dartz.dart';

import '../../../../../core/data/exception/failure.dart';
import '../../business/repository/auth_repository.dart';
import '../datasource/auth_datasource.dart';
import '../model/auth_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<DatabaseFailure, List<AuthModel>>> getAllAuth() async {
    return dataSource.getAllAuth();
  }
  @override
  Future<Either<DatabaseFailure, bool>> signIn(Map<String, String> param) async {
    return dataSource.signIn(param);
  }
  }