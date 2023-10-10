import 'package:expensive_tracker_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenseModel, {super.key});

  final ExpenseModel expenseModel;

  @override
  Widget build(context) {
    String amount = expenseModel.amount.toStringAsFixed(2);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              expenseModel.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Row(
              children: <Widget>[
                Text('\$$amount'),
                const Spacer(),
                Row(
                  children: <Widget>[
                    Icon(expenseModel.getCategoryIcon),
                    const SizedBox(width: 8),
                    Text(expenseModel.formatedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
