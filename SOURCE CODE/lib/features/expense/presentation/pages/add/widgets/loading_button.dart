import 'package:dot/shared/extensions/styles_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingButton extends StatelessWidget{
  const LoadingButton({
    super.key,
    this.radius = 6.0,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: OutlinedButton(
        onPressed: null,
        style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(
              color: colors.primary,
              width: 1,
            )),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  radius,
                ),
              ),
            )
        ),
        child: Center(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: LoadingAnimationWidget.prograssiveDots(color: colors.primary, size: 20.r),
          ),
        ),
      ),
    );
  }
}