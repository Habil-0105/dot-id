import 'package:dot/themes/app_color.dart';
import 'package:dot/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DailyExpenseItem extends StatelessWidget{
  const DailyExpenseItem({super.key, required this.icon, required this.color, required this.price, required this.name});
  final String icon;
  final Color color;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ]
      ),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 22.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage(icon),
            color: color,
            size: 20.h,
          ),
          Gap(14.w),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    name,
                    style: AppTypography.bodyText2.copyWith(color: AppColor.grey),
                  ),
                ),
                Flexible(
                  child: Text(
                    price,
                    style: AppTypography.subHeading3.copyWith(color: AppColor.grey),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}