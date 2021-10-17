import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  const TransactionList({
    Key? key,
    required this.userTransactions,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: userTransactions.isEmpty
          ? Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "No transactions added yet!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                Transaction tx = userTransactions.elementAt(index);
                return TransactionItem(
                  tx: tx,
                );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
