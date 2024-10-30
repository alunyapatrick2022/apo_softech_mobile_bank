// user.dart

import 'package:apo_softech_mobile_bank/screens/register_screen.dart';

class UserModel {
  String uid;
  String? email;
  String? displayName;
  String? phone;
  String? address;
  String? role;

  UserModel({
    required this.uid,
    this.email,
    this.displayName,
    this.phone,
    this.address,
    this.role,
  });

  // Factory constructor to create a UserModel from Firebase User data
  factory UserModel.fromFirebaseUser(User firebaseUser) {
    return UserModel(
      uid: firebaseUser.uid,
      email: firebaseUser.email,
      displayName: firebaseUser.displayName,
    );
  }

  // Factory constructor to create a UserModel from Firestore data
  factory UserModel.fromMap(Map<String, dynamic> data, String uid) {
    return UserModel(
      uid: uid,
      email: data['email'],
      displayName: data['displayName'],
      phone: data['phone'],
      address: data['address'],
      role: data['role'],
    );
  }

  // Method to convert UserModel to Firestore data
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'phone': phone,
      'address': address,
      'role': role,
    };
  }
}
