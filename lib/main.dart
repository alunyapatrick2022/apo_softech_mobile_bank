import 'package:apo_softech_mobile_bank/screens/home_screen.dart';
import 'package:apo_softech_mobile_bank/screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:apo_softech_mobile_bank/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class Firebase {
  static initializeApp() {}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APO.SOFTECH MOBILE Banking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TransactionScreen(),
      routes: {
        '/transactionscreen': (context) => TransactionScreen(),
        '/homescreen': (context) => const HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
