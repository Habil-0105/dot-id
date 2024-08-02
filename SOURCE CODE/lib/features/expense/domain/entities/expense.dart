class Expense{
  String? uuid;
  String? name;
  String? category;
  DateTime? date;
  int? price;
  DateTime? createdAt;

  Expense({
    required this.uuid,
    required this.name,
    required this.category,
    required this.date,
    required this.price,
    required this.createdAt,
  });
}