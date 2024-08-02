import 'package:dot/main.dart';
import 'package:dot/shared/extensions/styles_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static Future<bool?> customToast(String msg) {
    final colors = navigatorKey.currentContext!.appColors;

    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: colors.background,
        textColor: colors.onBackground,
        fontSize: 16.sp
    );
  }
}