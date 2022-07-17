// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'scanner_bloc.dart';

@immutable
abstract class ScannerEvent {}

class InitScanningEvt extends ScannerEvent {}

class AddBarcodeEvt extends ScannerEvent {
  final Barcode barcode;
  AddBarcodeEvt({
    required this.barcode,
  });
}
