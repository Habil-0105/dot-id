import 'package:dot/features/expense/presentation/pages/add/widgets/category_item.dart';
import 'package:dot/shared/utils/enums/category.dart';
import 'package:dot/themes/app_color.dart';
import 'package:dot/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CategoryBottomSheet extends StatelessWidget{
  const CategoryBottomSheet({super.key, required this.onTap});
  final void Function(Category) onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            )),
        padding: EdgeInsets.fromLTRB(28.w, 24.h, 28.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pilih Kategori",
                  style: AppTypography.labelText3.copyWith(color: AppColor.grey[2]),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.black,),
                )
              ],
            ),
            Gap(27.h),
            SizedBox(
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.15,
                    mainAxisSpacing: 2.h,
                    crossAxisSpacing: 1.47.w
                ),
                shrinkWrap: true,
                itemCount: Category.values.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  final category = Category.values[index];
                  return CategoryItem(
                      onTap: onTap,
                      category: category
                  );
                },
              ),
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}