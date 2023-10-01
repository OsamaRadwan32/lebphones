import 'phone.dart';

class Category {
  int id;
  String categoryName;
  List<Phone> phones;

  Category({
    this.id,
    this.categoryName,
    this.phones,
  });

  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    var phonesList = parsedJson['phones'] as List;
    List<Phone> phones = phonesList.map((i) => Phone.fromJson(i)).toList();

    return Category(
      id: parsedJson['id'] as int,
      categoryName: parsedJson['name'] as String,
      phones: phones,
    );
  }
}
