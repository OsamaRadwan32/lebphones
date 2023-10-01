class Phone {
  int id;
  String name;
  int price;

  Phone({
    this.id,
    this.name,
    this.price,
  });

  factory Phone.fromJson(Map<String, dynamic> parsedJson) {
    return Phone(
      id: parsedJson['id'] as int,
      name: parsedJson['name'] as String,
      price: parsedJson['price'] as int,
    );
  }
}
