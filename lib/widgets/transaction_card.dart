// transaction_card.dart
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String description;
  final double amount;
  final DateTime date;

  const TransactionCard(
      {super.key,
      required this.description,
      required this.amount,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(description),
      subtitle: Text('${date.day}/${date.month}/${date.year}'),
      trailing: Text('\$${amount.toStringAsFixed(2)}'),
    );
  }
}
