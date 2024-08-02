import 'package:dot/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:dot/features/expense/presentation/pages/home/widgets/expense_category_card.dart';
import 'package:dot/shared/extensions/num_extension.dart';
import 'package:dot/shared/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseCategoryList extends StatelessWidget{
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120.h,
      child: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state){
          return ListView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: 20.w),
            clipBehavior: Clip.none,
            children: state.expenseByCategory.entries.map((e){
              final category = e.key.toCategory;
              return ExpenseCategoryCard(
                color: category.color,
                icon: category.icon,
                name: category.name,
                total: e.value.convertToIdr,
              );
            }).toList(),
          );
        },
      ),
      // child: ListView.builder(
      //   itemCount: Category.values.length,
      //   physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      //   scrollDirection: Axis.horizontal,
      //   padding: EdgeInsets.symmetric(horizontal: 20.w),
      //   clipBehavior: Clip.none,
      //   itemBuilder: (context, index){
      //     final category = Category.values[index];
      //     return ExpenseCategoryCard(
      //       color: category.color,
      //       icon: category.icon,
      //       name: category.name,
      //       total: 20000.convertToIdr,
      //       index: index,
      //     );
      //   },
      // ),
    );
  }
}