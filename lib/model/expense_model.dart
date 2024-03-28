import "package:intl/intl.dart";
import "package:uuid/uuid.dart";
import "package:flutter/material.dart";

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, grocery }

// const Categ = 1125645;
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.grocery: Icons.food_bank,
  Category.leisure: Icons.laptop_chromebook,
  Category.travel: Icons.airplane_ticket,
};

class ExpenseModel {
  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final double amount;
  final Category category;
  final DateTime date;
  final String title;

  get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(List<ExpenseModel> allExpenses, this.category)
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();
  final Category category;
  final List<ExpenseModel> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
