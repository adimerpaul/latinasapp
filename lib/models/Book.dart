import 'package:hive/hive.dart';

part 'Book.g.dart';

@HiveType(typeId: 0)
class Book {
  @HiveField(0)
  int id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? author;
  @HiveField(4)
  String? image;
  @HiveField(5)
  String? description;
  @HiveField(6)
  double? price;
  @HiveField(7)
  int? quantity;
  @HiveField(8)
  double? total;

  Book({
    required this.id,
    this.name,
    this.author,
    this.image,
    this.description,
    this.price,
    this.quantity,
    this.total,
  });
}