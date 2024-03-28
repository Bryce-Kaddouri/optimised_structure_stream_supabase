import '../../business/usecase/auth_sign_in_usecase.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final AuthSignInUsecase signInUsecase;
AuthProvider({required this.signInUsecase,});
  Future<bool?> SignIn(Map<String, String> param) async {
    signInUsecase.call(param).then((value) {
      value.fold((l) {
        print(l.errorMessage);
      }, (r) {
        // do something with the result
      });
    });
}
  
}