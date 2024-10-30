// home_screen.dart
import 'package:flutter/material.dart';
import 'package:apo_softech_mobile_bank/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APO_SOFTECH_MOBILE_BANK'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          const BalanceCard(balance: 2500.00),
          Expanded(
              child: TransactionList()), // Use Expanded to make it scrollable
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.account_balance), label: 'Accounts'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  final double balance;

  const BalanceCard({required this.balance, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Balance',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${balance.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {'title': 'Grocery Store', 'amount': -50.00, 'date': '2023-10-01'},
    {'title': 'Salary', 'amount': 1500.00, 'date': '2023-09-30'},
    {'title': 'Coffee Shop', 'amount': -5.50, 'date': '2023-09-29'},
  ];

  TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return ListTile(
          title: Text(transaction['title']),
          subtitle: Text(transaction['date']),
          trailing: Text(
            '\$${transaction['amount'].toStringAsFixed(2)}',
            style: TextStyle(
              color: transaction['amount'] < 0 ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
