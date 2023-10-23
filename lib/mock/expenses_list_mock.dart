import 'package:expensive_tracker_app/models/expense_model.dart';

final List<ExpenseModel> expensesListMock = [
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