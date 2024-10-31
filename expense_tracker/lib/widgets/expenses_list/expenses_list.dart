import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemove});
  final void Function(Expense expense) onRemove;
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index].id),
        background: Container(
          color: Theme.of(context).colorScheme.error,
        ),
        onDismissed: (direction) {
          onRemove(expenses[index]);
        },
        child: ExpensesItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
