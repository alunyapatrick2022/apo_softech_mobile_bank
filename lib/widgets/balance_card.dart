// balance_card.dart
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final String balance;
  final String income;
  final String expenses;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.income,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      color: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Balance',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              '\$$balance',
              style: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBalanceDetail('Income', income, Colors.green),
                _buildBalanceDetail('Expenses', expenses, Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceDetail(String label, String amount, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          '\$$amount',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
