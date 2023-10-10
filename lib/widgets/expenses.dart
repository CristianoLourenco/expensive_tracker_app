import 'package:expensive_tracker_app/models/expense_model.dart';
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
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
      title: 'Flutter Course',
      date: DateTime.now(),
      amount: 19.99,
      category: Category.work,
    ),
    ExpenseModel(
      title: 'Cinema',
      date: DateTime.now(),
      amount: 15.87,
      category: Category.leisure,
    ),
  ];

// ! Methods
  void _addExpense(ExpenseModel model) {
    setState(() {
      _registeredExpenses.add(model);
    });
  }

  void _addExpenses() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) =>
          NewExpense(onAddExpense: _addExpense),
    );
  }

  void _removeExpense(ExpenseModel model) {
    setState(() {
      _registeredExpenses.remove(model);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Widget = mainContent = const Center(child: Text('No expenses'),)


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
      body: Column(
        children: <Widget>[
          const Text('The chart '),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
