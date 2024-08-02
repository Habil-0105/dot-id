import 'package:dot/shared/utils/constants/app_constant.dart';
import 'package:dot/shared/utils/enums/category.dart';

extension StringUtils on String{
  int get toInt{
    String cleanedAmount = replaceAll('Rp ', '').replaceAll('.', '');
    if(cleanedAmount.isEmpty) return 0;
    int amount = int.parse(cleanedAmount);
    return amount;
  }

  Category get toCategory{
    switch(this){
      case AppConstant.food:
        return Category.food;
      case AppConstant.internet:
        return Category.internet;
      case AppConstant.education:
        return Category.education;
      case AppConstant.gift:
        return Category.gift;
      case AppConstant.transport:
        return Category.transport;
      case AppConstant.cart:
        return Category.cart;
      case AppConstant.home:
        return Category.home;
      case AppConstant.sport:
        return Category.sport;
      case AppConstant.entertainment:
        return Category.entertainment;
      default:
        return Category.food;
    }
  }
}