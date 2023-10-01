import 'package:lebphones/models/lebphones_category.dart';
import 'package:lebphones/models/lebphones_phone.dart';

class LebPhones {
  List<LebPhonesCategory> categoryList;
  List<LebPhonesPhone> phonesList;

  LebPhones({
    this.categoryList,
    this.phonesList,
  });
}
