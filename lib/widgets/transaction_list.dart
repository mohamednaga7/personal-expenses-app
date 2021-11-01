import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(child: Text('\$${tx.amount}')),
                    ),
                  ),
                  title: Text(
                    tx.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(DateFormat.yMMMd().format(tx.date)),
                  trailing: MediaQuery.of(context).size.width > 360
                      ? FlatButton.icon(
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                          textColor: Theme.of(context).errorColor,
                          onPressed: () {
                            deleteTransaction(tx.id);
                          },
                        )
                      : IconButton(
                          onPressed: () {
                            deleteTransaction(tx.id);
                          },
                          color: Theme.of(context).errorColor,
                          icon: const Icon(Icons.delete),
                        ),
                ),
              );
            },
            itemCount: userTransactions.length,
          );
  }
}
