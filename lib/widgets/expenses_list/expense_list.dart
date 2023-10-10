import 'package:expensive_tracker_app/models/expense_model.dart';
import 'package:expensive_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel model) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final expenseItem = expenses[index];
        return Dismissible(
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context)
                  .colorScheme
                  .error
                  .withOpacity(.74),
            ),
            padding: const EdgeInsets.only(right: 16),
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context)
                  .cardTheme
                  .margin!
                  .horizontal,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  CupertinoIcons.delete,
                  color: Colors.white,
                ),
                Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          key: ValueKey(expenseItem),
          onDismissed: (direction) =>
              onRemoveExpense(expenseItem),
          child: ExpenseItem(expenseItem),
        );
      },
    );
  }
}
