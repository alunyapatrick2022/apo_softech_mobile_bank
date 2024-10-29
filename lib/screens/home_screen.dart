// home_screen.dart
import 'package:flutter/material.dart';
import 'package:apo_softech_mobile_bank/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banking App'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          BalanceCard(balance: 2500.00),
          TransactionList(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [],
      ),
    );
  }
}

class BalanceCard {}

class TransactionList {}
