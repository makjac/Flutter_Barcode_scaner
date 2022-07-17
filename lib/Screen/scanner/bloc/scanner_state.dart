// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'scanner_bloc.dart';

@immutable
abstract class ScannerState {}

class ScannerInitial extends ScannerState {}

class ScanningBarcode extends ScannerState {}

class BarcodeScanned extends ScannerState {}

class ScannerError extends ScannerState {
  final String error;
  ScannerError({
    required this.error,
  });
}
