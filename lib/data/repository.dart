import 'package:barcode_scaner/data/models/barcode.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BarcodeRepository {
  late final Box _barcodeBox;

  BarcodeRepository();

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(BarcodeAdapter());
    }
    _barcodeBox = await Hive.openBox<Barcode>('barcodes');
  }

  Future<void> close() async {
    if (_barcodeBox.isOpen) {
      await _barcodeBox.close();
    }
  }

  List<Barcode> getBarcodes() {
    final barcodeList = _barcodeBox.values.toList();
    return barcodeList as List<Barcode>;
  }

  Future<void> addBarcode(Barcode newBarcode) async {
    await _barcodeBox.add(newBarcode);
  }

  Future<List<Barcode>> removeBarcode(String id) async {
    final barcodeToDelete =
        await _barcodeBox.values.firstWhere((element) => element.id == id);
    await barcodeToDelete.delete();
    return getBarcodes();
  }
}
