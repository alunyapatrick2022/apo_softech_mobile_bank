// TODO Implement this library.

// firebase_auth.dart
// ignore: depend_on_referenced_packages
import 'package:apo_softech_mobile_bank/screens/register_screen.dart';
import 'package:apo_softech_mobile_bank/services/auth_service.dart';
// ignore: depend_on_referenced_packages
// import 'package:apo_softech_mobile_bank/services/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign Up (Register)
  Future<Future?> signUp(String name, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user as User?;

      // Update the display name
      await user?.updateDisplayName(name);
      await user?.reload();
      return _auth.currentUser;
    } catch (e) {
      if (kDebugMode) {
        if (kDebugMode) {
          print('Error during sign up: $e');
        }
      }
      return null;
    }
  }

  // Sign In (Login)
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      if (kDebugMode) {
        print('Error during sign in: $e');
      }
      return null;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print('Error during sign out: $e');
      }
    }
  }

  // Get Current User
  Future? getCurrentUser() {
    return _auth.currentUser;
  }

  // Send Password Reset Email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      if (kDebugMode) {
        print('Error sending password reset email: $e');
      }
    }
  }
}
