import 'package:dot/themes/app_color.dart';
import 'package:dot/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ExpenseCategoryCard extends StatelessWidget{
  const ExpenseCategoryCard({super.key, required this.color, required this.icon, required this.name, required this.total});
  final Color color;
  final String icon;
  final String name;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Container(
        width: 120.h,
        height: 120.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(2, 4),
              ),
            ]
        ),
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 18.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color
              ),
              child: Center(
                child: ImageIcon(
                  AssetImage(icon),
                  color: Colors.white,
                  size: 20.h,
                ),
              ),
            ),
            Gap(12.h),
            Text(
              name,
              style: AppTypography.caption1.copyWith(color: AppColor.grey[3]),
            ),
            Gap(7.h),
            Text(
              total,
              style: AppTypography.labelButton3.copyWith(color: AppColor.grey),
            )
          ],
        ),
      ),
    );
  }
}