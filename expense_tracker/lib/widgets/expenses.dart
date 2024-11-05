import "package:expense_tracker/widgets/chart/chart.dart";
import "package:expense_tracker/widgets/expenses_list/expenses_list.dart";
import "package:expense_tracker/widgets/new_expense.dart";
import "package:flutter/material.dart";
import "package:expense_tracker/models/expense.dart";

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Burger",
      amount: 20.9,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Pizza",
      amount: 10.99,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Cinema",
      amount: 15.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: "UK",
      amount: 50.0,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: "USA",
      amount: 60.0,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _showModal() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled:
            MediaQuery.of(context).size.width > 600 ? true : false,
        context: context,
        builder: (ctx) {
          return NewExpense(
            addList: _addExpense,
          );
        });
  }

  void _onRemove(Expense expense) {
    final eIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(
              () {
                _registeredExpenses.insert(eIndex, expense);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text("No expenses found."));
    final width = MediaQuery.of(context).size.width;
    if (_registeredExpenses.isNotEmpty) {
      mainContent = width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: ExpensesList(
                      expenses: _registeredExpenses, onRemove: _onRemove),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: ExpensesList(
                      expenses: _registeredExpenses, onRemove: _onRemove),
                ),
              ],
            );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _showModal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: mainContent,
    );
  }
}
