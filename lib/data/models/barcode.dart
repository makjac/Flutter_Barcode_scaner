import 'package:hive/hive.dart';

part 'barcode.g.dart';

@HiveType(typeId: 1)
class Barcode extends HiveObject {
  Barcode({required this.id, required this.barcode, required this.date});
  @HiveField(0)
  String id;

  @HiveField(1)
  final String barcode;

  @HiveField(2)
  final DateTime date;
}
