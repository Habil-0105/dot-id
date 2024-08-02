import 'package:card_loading/card_loading.dart';
import 'package:dot/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:dot/features/expense/presentation/pages/home/widgets/daily_expense_item.dart';
import 'package:dot/features/expense/presentation/pages/home/widgets/horizontal_padding.dart';
import 'package:dot/shared/extensions/date_time_extension.dart';
import 'package:dot/shared/extensions/num_extension.dart';
import 'package:dot/shared/extensions/string_extension.dart';
import 'package:dot/themes/app_color.dart';
import 'package:dot/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DailyExpenseList extends StatelessWidget{
  const DailyExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseBloc, ExpenseState>(
      builder: (context, state){
        if(state.status == ExpenseStatus.loading){
          return HorizontalPadding(
            child: Wrap(
              runSpacing: 20.h,
              children: List.generate(3, (index){
                return CardLoading(
                  height: 67.h,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(12),
                );
              }),
            ),
          );
        }

        return Wrap(
          runSpacing: 28.h,
          children: state.history.entries.map((data){
            final time = data.key;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HorizontalPadding(
                  child: Text(
                    time.dailyExpense,
                    style: AppTypography.labelButton2.copyWith(color: AppColor.grey),
                  ),
                ),
                Gap(20.h),
                HorizontalPadding(
                  child: Wrap(
                    runSpacing: 20.h,
                    children: List.generate(data.value.length, (index){
                      final expense = data.value[index];
                      final category = expense.category!.toCategory;

                      return DailyExpenseItem(
                          icon: category.icon,
                          color: category.color,
                          name: expense.name!,
                          price: expense.price!.convertToIdr
                      );
                    }),
                  ),
                )
              ],
            );
          }).toList(),
        );
      },
    );
  }
}