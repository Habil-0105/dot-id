part of 'expense_bloc.dart';

enum ExpenseStatus { initial, loading, error, add, fetch }

class ExpenseState extends Equatable{
  const ExpenseState({
    this.status = ExpenseStatus.initial,
    this.todayExpense = 0,
    this.monthExpense = 0,
    this.expenseByCategory = const {},
    this.history = const {},
  });

  final ExpenseStatus status;
  final int todayExpense;
  final int monthExpense;
  final Map<String, int> expenseByCategory;
  final Map<DateTime, List<ExpenseModel>> history;

  @override
  List<Object> get props => [
    status,
    todayExpense,
    monthExpense,
    expenseByCategory,
    history
  ];

  ExpenseState copyWith({
    ExpenseStatus? status,
    int? todayExpense,
    int? monthExpense,
    Map<String, int>? expenseByCategory,
    Map<DateTime, List<ExpenseModel>>? history
  }){
    return ExpenseState(
      status: status ?? this.status,
      todayExpense: todayExpense ?? this.todayExpense,
      monthExpense: monthExpense ?? this.monthExpense,
      expenseByCategory: expenseByCategory ?? this.expenseByCategory,
      history: history ?? this.history
    );
  }
}