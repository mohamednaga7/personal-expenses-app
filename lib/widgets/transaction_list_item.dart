import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction tx;
  final Function deleteTransaction;
  const TransactionListItem(
      {Key? key, required this.tx, required this.deleteTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
