import 'package:lebphones/models/api.dart';
import 'package:lebphones/models/category.dart';
import 'package:lebphones/models/lebphones_phone.dart';
import 'package:lebphones/services/api_consumer.dart';
import 'package:lebphones/services/utilities/dart_utilities.dart';
import 'package:string_extensions/string_extensions.dart';

class LebPhonesPhoneServices {
  LebPhonesPhoneServices();

  // returns a list of all the phones found in the JSON object
  static Future<List<LebPhonesPhone>> getLebPhones() async {
    APIConsumer phoneLibrary = new APIConsumer();

    APIResponse api = await phoneLibrary.apiProvider();
    List<Category> categoryList = api.categoryList;
    List<LebPhonesPhone> phonesList = _populateLebPhonesList(categoryList);
    return phonesList;
  }

  static _modifyUsedAppleCategory(Category category, LebPhonesPhone lebPhone) {
    if (category.categoryName == "APPLE") {
      lebPhone.category = "Used Apple";
      lebPhone.image = "Apple";
    } else {
      lebPhone.category = category.categoryName.capitalize();
      lebPhone.image = category.categoryName.capitalize();
    }
  }

  static List<LebPhonesPhone> _populateLebPhonesList(
      List<Category> categoryList) {
    List<LebPhonesPhone> phonesList = [];

    int idCounter = 1;

    categoryList.forEach((categoryMap) {
      categoryMap.phones.forEach((phone) {
        LebPhonesPhone lebPhone = new LebPhonesPhone();

        lebPhone.id = idCounter;
        lebPhone.oldName = phone.name;
        lebPhone.newName = DartUtilities.cleanText(phone.name);
        lebPhone.initialPrice = phone.price;
        lebPhone.finalPrice = DartUtilities.calculateFinalPrice(phone.price);

        _modifyUsedAppleCategory(categoryMap, lebPhone);
        phonesList.add(lebPhone);
        idCounter += 1;
      });
    });
    return phonesList;
  }
}

void main() async {
  var listOfAllPhones = await LebPhonesPhoneServices.getLebPhones();
  print("List of Phones:\n");
  for (var phone in listOfAllPhones) {
    String lebphone = "Phone ID: ${phone.id},\n" +
        "Old Name: ${phone.oldName},\n" +
        "New Name: ${phone.newName},\n" +
        "Category: ${phone.category},\n" +
        "InitialPrice: ${phone.initialPrice}\$,\n" +
        "Final Price: ${phone.finalPrice}\$,\n" +
        "Image: ${phone.image};\n";
    print(lebphone);
  }
}
