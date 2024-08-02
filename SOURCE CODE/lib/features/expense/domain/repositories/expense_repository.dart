import 'package:dot/features/expense/data/model/expense_model.dart';

abstract class ExpenseRepository{
  Future<bool> insertExpense({required ExpenseModel expense});
  Future<List<ExpenseModel>> fetchExpenses();
}