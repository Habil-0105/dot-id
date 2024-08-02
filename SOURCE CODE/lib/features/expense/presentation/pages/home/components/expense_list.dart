import 'package:dot/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:dot/features/expense/presentation/pages/home/widgets/expense_card.dart';
import 'package:dot/features/expense/presentation/pages/home/widgets/horizontal_padding.dart';
import 'package:dot/shared/extensions/num_extension.dart';
import 'package:dot/shared/extensions/styles_extension.dart';
import 'package:dot/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ExpenseList extends StatelessWidget{
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return BlocBuilder<ExpenseBloc, ExpenseState>(
      builder: (context, state){
        return HorizontalPadding(
          child: Row(
            children: [
              ExpenseCard(
                  color: colors.primary,
                  title: "Pengeluaranmu hari ini",
                  data: state.todayExpense.convertToIdr
              ),
              Gap(19.w),
              ExpenseCard(
                  color: AppColor.teal,
                  title: "Pengeluaranmu bulan ini",
                  data: state.monthExpense.convertToIdr
              ),
            ],
          ),
        );
      },
    );
  }
}