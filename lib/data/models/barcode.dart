import 'package:hive/hive.dart';

part 'barcode.g.dart';

@HiveType(typeId: 1)
class Barcode extends HiveObject {
  Barcode({required this.barcode, required this.date});
  @HiveField(0)
  final String barcode;

  @HiveField(1)
  final DateTime date;
}
