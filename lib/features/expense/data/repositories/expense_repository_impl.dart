import 'dart:convert';

import 'package:dot/features/expense/data/model/expense_model.dart';
import 'package:dot/features/expense/domain/repositories/expense_repository.dart';
import 'package:dot/shared/services/local/local_storage.dart';
import 'package:dot/shared/utils/constants/storage_key.dart';

class ExpenseRepositoryImpl extends ExpenseRepository{
  @override
  Future<bool> insertExpense({required ExpenseModel expense})async{
    try{
      final expensesLocal = await LocalStorage.instance.expenses;
      List<ExpenseModel> expenses = <ExpenseModel>[];

      if(expensesLocal.isEmpty){
        expenses.add(expense);
        LocalStorage.instance.setData<String>(StorageKey.expenses, jsonEncode(expenses));
        return true;
      }

      var expensesJson = jsonDecode(expensesLocal);

      expenses = (expensesJson as Iterable).map((e) => ExpenseModel.fromJson(e)).toList();
      expenses.insert(0, expense);

      LocalStorage.instance.setData<String>(StorageKey.expenses, jsonEncode(expenses));
      return true;
    }catch(e){
      return false;
    }
  }

  @override
  Future<List<ExpenseModel>> fetchExpenses()async{
    final expensesLocal = await LocalStorage.instance.expenses;
    List<ExpenseModel> expenses = <ExpenseModel>[];

    if(expensesLocal.isEmpty){
      return expenses;
    }

    var expensesJson = jsonDecode(expensesLocal);
    expenses = (expensesJson as Iterable).map((e) => ExpenseModel.fromJson(e)).toList();
    return expenses;
  }
}