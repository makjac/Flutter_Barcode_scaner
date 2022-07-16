// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'scaner_bloc.dart';

@immutable
abstract class ScanerState {}

class ScanerInitial extends ScanerState {}

class ScanningBarcode extends ScanerState {}

class BarcodeScaned extends ScanerState {}

class ScanerError extends ScanerState {
  final String error;
  ScanerError({
    required this.error,
  });
}
