import 'package:dartz/dartz.dart';
    
import '../../../../../core/data/exception/failure.dart';
import '../repository/auth_repository.dart';
import '../../../../../core/data/usecase/usecase.dart';

    
class AuthSignInUsecase extends UseCase<bool, Map<String, String>> {
    final AuthRepository repository;
    
    AuthSignInUsecase({required this.repository});
    
    @override
    Future<Either<DatabaseFailure, bool>> call(Map<String, String> params) async {
       return repository.signIn(params);
    }
}
