import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/data/exception/failure.dart';
import '../model/auth_model.dart';

class AuthDataSource {
  final _client = Supabase.instance.client;
  // final AuthLocalDataSource localDataSource;
  // final AuthRemoteDataSource remoteDataSource;

  // AuthDataSource({required this.localDataSource, required this.remoteDataSource});

  Future<Either<DatabaseFailure, List<AuthModel>>> getAllAuth() async {
    try {
      // final localData = await localDataSource.getAllAuth();
      return Right([]);
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<DatabaseFailure, bool>> signIn(Map<String, String> param) async {
    try {
      AuthResponse response = await _client.auth.signInWithPassword(
        email: param['email']!,
        password: param['password']!,
      );
      if (response.user == null) {
        return Left(DatabaseFailure(errorMessage: 'Sign in failed'));
      }
      return Right(true);
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: e.toString()));
    }
  }
}
