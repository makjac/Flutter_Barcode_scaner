// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'scaner_bloc.dart';

@immutable
abstract class ScanerEvent {}

class InitScanningEvt extends ScanerEvent {}

class AddBarcodeEvt extends ScanerEvent {
  final Barcode barcode;
  AddBarcodeEvt({
    required this.barcode,
  });
}
