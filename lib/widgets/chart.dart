import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/chart_bar.dart';
import '../models/transaction.dart';

class ChartBarData {
  String day;
  double amount;

  ChartBarData(this.day, this.amount);
}

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  List<ChartBarData> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return ChartBarData(
          DateFormat.E().format(weekday).substring(0, 1), totalSum);
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + element.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  label: data.day,
                  spendingAmount: data.amount,
                  spendingPctOfTotal:
                      totalSpending == 0 ? 0.0 : data.amount / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
