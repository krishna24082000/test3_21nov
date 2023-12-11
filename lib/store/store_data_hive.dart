import 'package:hive/hive.dart';
part 'store_data_hive.g.dart';

@HiveType(typeId: 0)
class DataModel extends HiveObject {
  
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? productName;

  @HiveField(2)
  final String? date;

  @HiveField(3)
  final int? rating;

  DataModel({
    this.name,
    this.productName,
    this.date,
    this.rating,
  });
}
/*

@HiveType(typeId: 0)
class DataModel extends HiveObject {
  @HiveField(0)
  final String? fName;

  @HiveField(1)
  final String? lName;

  @HiveField(2)
  final String? date;

  @HiveField(3)
  final String? email;

  @HiveField(4)
  final String? gender;

  @HiveField(5)
  final String? city;

  @HiveField(6)
  final String? number;

  @HiveField(7)
  final String? fullName;

  DataModel(
      {this.fName,
      this.fullName,
      this.lName,
      this.date,
      this.email,
      this.gender,
      this.city,
      required this.number});
}

 */