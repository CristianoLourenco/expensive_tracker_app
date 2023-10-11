import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

// work with enum is a safety wey to make sure that we wont get the rong values
enum Category { food, travel, leisure, work }

final formatter = DateFormat.yMd();

const categoryIcons = <Category, IconData>{
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class ExpenseModel {
  ExpenseModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  IconData get getCategoryIcon {
    return categoryIcons[category] ?? Icons.warning;
  }

  String get formatedDate {
    return formatter.format(date);
  }
}

class ExpenseBucketModel {
  final Category category;
  final List<ExpenseModel> expenseList;

  ExpenseBucketModel({
    required this.category,
    required this.expenseList,
  });

  ExpenseBucketModel.forCategory(
      List<ExpenseModel> allExpenses, this.category)
      : expenseList = allExpenses
            .where((expnse) => expnse.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0;
    for (var expenseModel in expenseList) {
      sum += expenseModel.amount; //sum = sum +model.amount
    }
    return sum;
  }
}
