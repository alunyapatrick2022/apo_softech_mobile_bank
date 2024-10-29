// auth_provider.dart
import 'package:apo_softech_mobile_bank/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool isAuthenticated = false;

  void login(String email, String password) async {
    await _authService.signIn(email, password);
    isAuthenticated = true;
    notifyListeners();
  }

  void logout() async {
    await _authService.signOut();
    isAuthenticated = false;
    notifyListeners();
  }
}
