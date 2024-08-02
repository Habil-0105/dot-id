import 'package:dot/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:dot/features/expense/presentation/pages/home/components/daily_expense_list.dart';
import 'package:dot/features/expense/presentation/pages/home/components/expense_category_list.dart';
import 'package:dot/features/expense/presentation/pages/home/components/expense_list.dart';
import 'package:dot/features/expense/presentation/pages/home/widgets/horizontal_padding.dart';
import 'package:dot/injector.dart';
import 'package:dot/shared/extensions/styles_extension.dart';
import 'package:dot/shared/utils/routes/app_routes.dart';
import 'package:dot/themes/app_color.dart';
import 'package:dot/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    injector<ExpenseBloc>().add(FetchExpenses());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20.h),
                HorizontalPadding(
                  child: Text(
                    "Halo, User!",
                    style: AppTypography.heading7.copyWith(color: AppColor.grey),
                  ),
                ),
                Gap(4.h),
                HorizontalPadding(
                  child: Text(
                    "Jangan lupa catat keuanganmu setiap hari!",
                    style: AppTypography.bodyText2.copyWith(color: AppColor.grey[3]),
                  ),
                ),
                Gap(20.h),
                const ExpenseList(),
                Gap(20.h),
                HorizontalPadding(
                  child: Text(
                    "Pengeluaran berdasarkan kategori",
                    style: AppTypography.labelButton2.copyWith(color: AppColor.grey),
                  ),
                ),
                Gap(20.h),
                const ExpenseCategoryList(),
                Gap(28.h),
                const DailyExpenseList(),
                Gap(28.h)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () => Navigator.pushNamed(context, AppRoutes.addPage),
        shape: const CircleBorder(),
        elevation: 0,
        backgroundColor: colors.primary,
        child: Center(
          child: Icon(Icons.add, color: Colors.white, size: 16.h,),
        ),
      ),
    );
  }
}