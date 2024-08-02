import 'package:dot/shared/utils/enums/category.dart';
import 'package:dot/themes/app_color.dart';
import 'package:dot/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CategoryItem extends StatelessWidget{
  const CategoryItem({super.key, required this.onTap, required this.category});
  final void Function(Category) onTap;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(category);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: category.color
            ),
            child: Center(
              child: ImageIcon(
                AssetImage(category.icon),
                color: Colors.white,
                size: 20.h,
              ),
            ),
          ),
          Gap(4.h),
          Text(
            category.name,
            style: AppTypography.caption1.copyWith(color: AppColor.grey[3]),
          )
        ],
      ),
    );
  }
}