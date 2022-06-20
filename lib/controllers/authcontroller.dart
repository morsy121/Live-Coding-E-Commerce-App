import 'package:ecommerceapp/services/auth.dart';
import 'package:ecommerceapp/utilites/enums.dart';
import 'package:flutter/cupertino.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;

  AuthController(
      {required this.auth,
      this.authFormType = AuthFormType.login,
      this.email = "",
      this.password = ""});

  Future<void> sunbmit() async {
    try {
      if (authFormType == AuthFormType.login) {
        await auth.loginWithEmailAndPassword(email, password);
      } else {
        await auth.signupWithEmailAndPassword(email, password);
      }
    } catch (e) {
      rethrow;
    }
  }

  //Method to update email وبيعمل ابديت من خلال القيمه الي ف الكنترولر
  void updateEmail(String email) => copyWith(email: email);

  //Method to update password وبيعمل ابديت من خلال القيمه الي ف الكنترول
  void updatePassword(String password) => copyWith(password: password);

  void toggelFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    copyWith(
      email: "",
      password: "",
      authFormType: formType,
    );
  }

  void copyWith({
    String? email,
    String? password,
    AuthFormType? authFormType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }
}
