import 'category.dart';

class APIResponse {
  bool success;
  String message;
  List<Category> categoryList;
  String error;

  APIResponse({
    this.success,
    this.message,
    this.categoryList,
    this.error,
  });

  factory APIResponse.fromJson(Map<String, dynamic> parsedJson) {
    var jsonCategories = parsedJson['data'] as List;
    List<Category> categoryList =
        jsonCategories.map((i) => Category.fromJson(i)).toList();

    return APIResponse(
      success: parsedJson['success'] as bool,
      message: parsedJson['message'] as String,
      categoryList: categoryList,
    );
  }

  APIResponse.withError(String errorValue)
      : categoryList = [],
        error = errorValue;
}
