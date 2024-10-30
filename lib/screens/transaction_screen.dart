// transaction_screen.dart
import 'package:flutter/material.dart';
import 'package:apo_softech_mobile_bank/widgets/balance_card.dart';
import 'package:apo_softech_mobile_bank/widgets/transaction_card.dart';

class TransactionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      'title': 'Groceries',
      'date': '2024-10-29',
      'amount': '20.50',
      'isIncome': false,
    },
    {
      'title': 'Salary',
      'date': '2024-10-28',
      'amount': '1500.00',
      'isIncome': true,
    },
    {
      'title': 'Coffee',
      'date': '2024-10-27',
      'amount': '5.00',
      'isIncome': false,
    },
  ];

  TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            tooltip: 'Send Money',
            onPressed: () => _showSendMoneyDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.account_balance_wallet),
            tooltip: 'Withdraw',
            onPressed: () => _showWithdrawDialog(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(56.0),
              child: BalanceCard(
                balance: '1234.56',
                income: '5000.00',
                expenses: '3765.44',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 56.0),
              child: Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionCard(
                  transactionTitle: transactions[index]['title'],
                  transactionDate: transactions[index]['date'],
                  transactionAmount: transactions[index]['amount'],
                  isIncome: transactions[index]['isIncome'],
                );
              },
            ),
          ],
        ),
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

  // Function to show Send Money dialog
  void _showSendMoneyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Send Money'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Recipient Full Names'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to send money would go here
                Navigator.pop(context);
              },
              child: const Text('Send'),
            ),
          ],
        );
      },
    );
  }

  // Function to show Withdraw dialog
  void _showWithdrawDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Withdraw'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: 'Phone  Number or Wallet ID'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to withdraw money would go here
                Navigator.pop(context);
              },
              child: const Text('Withdraw'),
            ),
          ],
        );
      },
    );
  }
}
