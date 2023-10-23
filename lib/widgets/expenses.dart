import 'package:expensive_tracker_app/mock/expenses_list_mock.dart';
import 'package:expensive_tracker_app/models/expense_model.dart';
import 'package:expensive_tracker_app/widgets/chart/chart.dart';
import 'package:expensive_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'expenses_list/expense_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    late Widget mainContent;

    if (expensesListMock.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: expensesListMock,
        onRemoveExpense: _removeExpense,
      );
    } else {
      mainContent = const Center(
        child: Text('No expenses found!'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: <Widget>[
          IconButton(
            onPressed: _addExpenses,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: width < 600
          ? Column(
              children: <Widget>[
                Chart(expenses: expensesListMock),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: <Widget>[
                Expanded(
                  child: Chart(expenses: expensesListMock),
                ),
                Expanded(child: mainContent),
              ],
            ),
    );
  }

// ! Methods
  void _addExpense(ExpenseModel model) {
    setState(() {
      expensesListMock.add(model);
    });
  }

  void _addExpenses() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) =>
          NewExpense(onAddExpense: _addExpense),
    );
  }

  void _removeExpense(ExpenseModel model) {
    final expenseIndex = expensesListMock.indexOf(model);
    setState(() {
      expensesListMock.remove(model);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => setState(() {
            expensesListMock.insert(expenseIndex, model);
          }),
        ),
      ),
    );
  }


}
