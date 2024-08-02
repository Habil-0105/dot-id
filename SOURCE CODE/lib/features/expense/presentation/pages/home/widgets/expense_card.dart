import 'package:dot/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseCard extends StatelessWidget{
  const ExpenseCard({super.key, required this.color, required this.title, required this.data});
  final Color color;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 97.h,
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTypography.subHeading3.copyWith(color: Colors.white, height: 1.2.sp),
            ),
            Text(
              data,
              style: AppTypography.heading7.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}