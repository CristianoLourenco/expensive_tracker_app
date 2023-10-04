import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

// work with enum is a safety wey to make sure that we wont get the rong values
enum Category { food, travel, leisure, work }

final _formatter = DateFormat.yMd();

const _categoryIcons = <Category, IconData>{
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
    return _categoryIcons[category] ?? Icons.warning;
  }

  String get formatedDate {
    return _formatter.format(date);
  }
}
