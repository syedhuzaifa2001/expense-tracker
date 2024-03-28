import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses, required this.remove});
  final List<ExpenseModel> expenses;
  final Function(ExpenseModel expense) remove;
  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
              key: ValueKey(expenses[index]),
              onDismissed: (direction) {
                remove(expenses[index]);
              },
              child: ExpenseItem(expenses: expenses[index]),
            ));
  }
}
