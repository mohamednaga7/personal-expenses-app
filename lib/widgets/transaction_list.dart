import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/transaction_list_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final Function deleteTransaction;
  final List<Transaction> userTransactions;
  const TransactionList(
      {Key? key,
      required this.userTransactions,
      required this.deleteTransaction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) => Column(
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
                      height: constraints.maxHeight * .6,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ))
        : ListView.builder(
            itemBuilder: (ctx, index) {
              Transaction tx = userTransactions.elementAt(index);
              return TransactionListItem(
                  tx: tx, deleteTransaction: deleteTransaction);
            },
            itemCount: userTransactions.length,
          );
  }
}
