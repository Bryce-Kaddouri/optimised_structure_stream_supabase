import 'package:dartz/dartz.dart';

import '../../../../../core/data/exception/failure.dart';
import '../model/home_model.dart';

class HomeDataSource {
  // final HomeLocalDataSource localDataSource;
  // final HomeRemoteDataSource remoteDataSource;

  // HomeDataSource({required this.localDataSource, required this.remoteDataSource});

  Future<Either<DatabaseFailure, List<HomeModel>>> getAllHome() async {
    try {
      // final localData = await localDataSource.getAllHome();
      return Right([]);
    } catch (e) {
      return Left(DatabaseFailure(errorMessage: e.toString()));
    }
  }
}
