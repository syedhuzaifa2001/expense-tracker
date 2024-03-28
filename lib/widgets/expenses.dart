import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final _expenses = [
    ExpenseModel(
        title: "Hello1",
        amount: 12.69,
        date: DateTime.now(),
        category: Category.leisure),
    ExpenseModel(
        title: "Hello2",
        amount: 45.65,
        date: DateTime.now(),
        category: Category.food),
    ExpenseModel(
        title: "Hello3",
        amount: 78.88,
        date: DateTime.now(),
        category: Category.travel),
  ];

  void openModel() {
    showModalBottomSheet(
      useSafeArea:
          true, //stay away from mobile vfeatures like camera and so on,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: onAdd,
      ),
    );
  }

  void onAdd(ExpenseModel expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void onRemove(ExpenseModel expense) {
    final expenseIndex = _expenses.indexOf(expense);
    setState(() {
      _expenses.remove(expense);
    });
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // to immediately clear the snackbar without wait for 3s
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("data"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text("No Expenses to show"),
    );
    if (_expenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _expenses,
        remove: onRemove,
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("Expense Tracker"),
          actions: [
            IconButton(
              onPressed: openModel,
              icon: const Icon(Icons.add_box),
            ),
          ],
        ),
        body: width < 600
            ? Column(
                children: [
                  // const Text("Chart"),
                  Expanded(child: mainContent),
                ],
              )
            : Row(
                children: [
                  const Text("Chart"),
                  Expanded(child: mainContent),
                ],
              ));
  }
}
