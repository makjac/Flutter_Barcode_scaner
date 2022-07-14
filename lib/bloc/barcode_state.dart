// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'barcode_bloc.dart';

@immutable
abstract class BarcodeState {
  const BarcodeState();

  List<Object> get props => [];
}

class BarcodeInitial extends BarcodeState {}

class LoadingBarc extends BarcodeState {}

class BarcodesLoaded extends BarcodeState {
  final List<Barcode> barcodes;
  const BarcodesLoaded({
    required this.barcodes,
  });
}

class BarcodesError extends BarcodeState {
  final String error;
  const BarcodesError({
    required this.error,
  });
}
