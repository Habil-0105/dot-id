part of 'expense_bloc.dart';

abstract class ExpenseEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class InsertExpense extends ExpenseEvent{
  final ExpenseModel expense;

  InsertExpense({required this.expense});
}

class FetchExpenses extends ExpenseEvent{}