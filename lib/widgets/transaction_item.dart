import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tx;
  const TransactionItem({Key? key, required this.tx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              '\$${tx.amount.toStringAsFixed(2)}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2)),
            padding: const EdgeInsets.all(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tx.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat.yMMMd().format(tx.date),
                style: TextStyle(color: Theme.of(context).primaryColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
