import 'package:dot/features/expense/domain/entities/expense.dart';

class ExpenseModel extends Expense{
  ExpenseModel({
    required super.uuid,
    required super.name,
    required super.category,
    required super.date,
    required super.price,
    required super.createdAt
  });

  ExpenseModel copyWith({
    String? uuid,
    String? name,
    String? category,
    DateTime? date,
    int? price,
    DateTime? createdAt
  }) {
    return ExpenseModel(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      category: category ?? this.category,
      date: date ?? this.date,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt
    );
  }

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
    uuid: json["uuid"],
    name: json["name"],
    category: json["category"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    price: json["price"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"])
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "name": name,
    "category": category,
    "date": date?.toIso8601String(),
    "price": price,
    "created_at": createdAt?.toIso8601String(),
  };
}