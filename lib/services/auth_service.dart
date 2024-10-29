// auth_service.dart
// ignore: depend_on_referenced_packages
import 'package:apo_softech_mobile_bank/screens/register_screen.dart';
// ignore: depend_on_referenced_packages
// import 'package:apo_softech_mobile_bank/services/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      if (kDebugMode) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class UserCredential {
  Future<User?>? get user => null;
}

class FirebaseAuth {
  static FirebaseAuth instance;

  Future<dynamic>? get currentUser => null;

  signInWithEmailAndPassword(
      {required String email, required String password}) {}

  signOut() {}

  sendPasswordResetEmail({required String email}) {}

  createUserWithEmailAndPassword(
      {required String email, required String password}) {}
}
