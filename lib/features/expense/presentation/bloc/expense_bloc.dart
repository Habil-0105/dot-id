import 'package:dot/features/expense/data/model/expense_model.dart';
import 'package:dot/features/expense/domain/repositories/expense_repository.dart';
import 'package:dot/shared/extensions/date_time_extension.dart';
import 'package:dot/shared/utils/constants/app_constant.dart';
import 'package:dot/shared/utils/enums/category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository expenseRepository;

  ExpenseBloc({required this.expenseRepository}) : super(const ExpenseState()) {
    on<InsertExpense>(_onInsertExpense);
    on<FetchExpenses>(_onFetchExpenses);
  }

  Future<void> _onInsertExpense(InsertExpense event, Emitter<ExpenseState> emit)async{
    emit(state.copyWith(status: ExpenseStatus.initial));

    final status = await expenseRepository.insertExpense(expense: event.expense);

    emit(state.copyWith(
      status: status ? ExpenseStatus.add : ExpenseStatus.error
    ));
  }

  Future<void> _onFetchExpenses(FetchExpenses event, Emitter<ExpenseState> emit)async{
    int todayExpense = 0;
    int monthExpense = 0;
    Map<String, int> expenseByCategory = {
      AppConstant.food : 0,
      AppConstant.internet : 0,
      AppConstant.education : 0,
      AppConstant.gift : 0,
      AppConstant.transport : 0,
      AppConstant.cart : 0,
      AppConstant.home : 0,
      AppConstant.sport : 0,
      AppConstant.entertainment : 0,
    };
    Map<DateTime, List<ExpenseModel>> history = {};

    emit(state.copyWith(status: ExpenseStatus.loading));

    final response = (await expenseRepository.fetchExpenses());

    if(response.isEmpty){
      emit(state.copyWith(
        status: ExpenseStatus.fetch,
        expenseByCategory: expenseByCategory
      ));
      return;
    }

    final now = DateTime.now();

    // today
    List<ExpenseModel> todayExpenses = List.from(response);
    final today = now.toUniqueDate;
    todayExpense = todayExpenses
        .where((e) => e.date!.toUniqueDate == today)
        .fold(0, (sum, item) => sum + item.price!);

    // month
    List<ExpenseModel> monthExpenses = List.from(response);
    final month = now.toUniqueMonth;
    monthExpense = monthExpenses
        .where((e) => e.date!.toUniqueMonth == month)
        .fold(0, (sum, item) => sum + item.price!);

    // by category
    for(var category in Category.values){
      List<ExpenseModel> categoryExpenses = List.from(response);

      int total = categoryExpenses
          .where((expense) => expense.category == category.name)
          .fold(0, (sum, item) => sum + item.price!);
      expenseByCategory[category.name] = total;
    }

    // history
    List<ExpenseModel> historyExpenses = List.from(response);
    historyExpenses.sort((a, b) => b.date!.compareTo(a.date!));

    for (var expense in historyExpenses) {
      DateTime date = DateTime(
        expense.date!.year,
        expense.date!.month,
        expense.date!.day,
      );

      if (history.containsKey(date)) {
        history[date]!.add(expense);
      } else {
        history[date] = [expense];
      }
    }

    emit(state.copyWith(
      status: ExpenseStatus.fetch,
      todayExpense: todayExpense,
      monthExpense: monthExpense,
      expenseByCategory: expenseByCategory,
      history: history
    ));
  }
}
