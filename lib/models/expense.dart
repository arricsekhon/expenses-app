import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  food,
  bills,
  clothes,
  entertainment,
  education,
  other,
}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.bills: Icons.money,
  Category.clothes: Icons.shopping_bag,
  Category.entertainment: Icons.movie,
  Category.education: Icons.school,
  Category.other: Icons.category,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.categorty,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category categorty;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
      : expenses = allExpense
            .where((expense) => expense.categorty == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpense {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
