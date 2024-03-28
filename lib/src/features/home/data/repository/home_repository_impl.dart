import 'package:dartz/dartz.dart';

import '../../../../../core/data/exception/failure.dart';
import '../../business/repository/home_repository.dart';
import '../datasource/home_datasource.dart';
import '../model/home_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl({required this.dataSource});

  @override
  Future<Either<DatabaseFailure, List<HomeModel>>> getAllHome() async {
    return dataSource.getAllHome();
  }
}
