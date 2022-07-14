import 'package:barcode_scaner/data/models/barcode.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BarcodeRepository {
  late final Box _barcodeBox;

  BarcodeRepository() {
    init();
  }

  Future<void> init() async {
    Hive.registerAdapter(BarcodeAdapter());
    _barcodeBox = await Hive.openBox<Barcode>('barcodes');
  }

  Box get barcodeBox => _barcodeBox;

  List<Barcode> getBarcodes() {
    final barcodeList = _barcodeBox.values.toList();
    return barcodeList as List<Barcode>;
  }

  Future<List<Barcode>> addBarcode(Barcode newBarcode) async {
    await _barcodeBox.add(newBarcode);
    return getBarcodes();
  }

  Future<List<Barcode>> removeBarcode(String id) async {
    final barcodeToDelete =
        await _barcodeBox.values.firstWhere((element) => element.id == id);
    await barcodeToDelete.delete();
    return getBarcodes();
  }
}
