import 'package:dot/features/expense/data/repositories/expense_repository_impl.dart';
import 'package:dot/features/expense/domain/repositories/expense_repository.dart';
import 'package:dot/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void injectorSetup() {
  injector.registerLazySingleton<ExpenseRepository>(() => ExpenseRepositoryImpl());
  injector.registerSingleton<ExpenseBloc>(
      ExpenseBloc(expenseRepository: injector<ExpenseRepository>())
  );
}