import "package:expense_tracker/model/expense_model.dart";
// import "package:expense_tracker/widgets/expenses.dart";
import "package:flutter/material.dart";

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expenses});
  final ExpenseModel expenses;
  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 13,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenses.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  "\$ ${expenses.amount.toStringAsFixed(2)}",
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expenses.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expenses.formattedDate),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
