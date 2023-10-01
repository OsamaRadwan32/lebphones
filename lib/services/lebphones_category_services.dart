import 'package:lebphones/models/api.dart';
import 'package:lebphones/models/category.dart';
import 'package:lebphones/models/lebphones_category.dart';
import 'package:lebphones/services/api_consumer.dart';
import 'package:string_extensions/string_extensions.dart';

class LebPhonesCategoryServices {
  LebPhonesCategoryServices();

  // returns a list of all the categories available in the JSON object
  static Future<List<LebPhonesCategory>> getCategories() async {
    APIConsumer phoneLibrary = new APIConsumer();
    APIResponse api = await phoneLibrary.apiProvider();
    List<Category> categoryList = api.categoryList;
    List<LebPhonesCategory> lebPhonesCategoryList = [];
    int idCounter = 1;

    categoryList.forEach((category) {
      LebPhonesCategory lebPhonesCategory = new LebPhonesCategory();
      lebPhonesCategory.id = idCounter;
      _modifyUsedAppleCategory(category, lebPhonesCategory);
      lebPhonesCategoryList.add(lebPhonesCategory);
      idCounter += 1;
    });
    return lebPhonesCategoryList;
  }

  static _modifyUsedAppleCategory(
      Category category, LebPhonesCategory lebPhonesCategory) {
    if (category.categoryName == "APPLE") {
      lebPhonesCategory.categoryName = "Used Apple";
      lebPhonesCategory.image = "Apple";
    } else {
      lebPhonesCategory.categoryName = category.categoryName.capitalize();
      lebPhonesCategory.image = category.categoryName.capitalize();
    }
  }
}

void main() async {
  var listOfCategories = await LebPhonesCategoryServices.getCategories();
  print("List of Categories:\n");
  listOfCategories.forEach((category) {
    String printedCategory = "Category ID: ${category.id},\n" +
        "Category Name: ${category.categoryName},\n" +
        "Image: ${category.image};\n";
    print(printedCategory);
  });
}
