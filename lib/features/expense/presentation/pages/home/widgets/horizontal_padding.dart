import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalPadding extends StatelessWidget{
  const HorizontalPadding({super.key, required this.child, this.value});
  final Widget child;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value ?? 20.w),
      child: child,
    );
  }
}