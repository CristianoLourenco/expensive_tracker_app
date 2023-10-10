import 'package:expensive_tracker_app/models/expense_model.dart';
import 'package:expensive_tracker_app/widgets/expenses_list/expense_item.dart';
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
          key: ValueKey(expenseItem),
          onDismissed: (direction) =>
              onRemoveExpense(expenseItem),
          child: ExpenseItem(expenseItem),
        );
      },
    );
  }
}
