// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'barcode_bloc.dart';

@immutable
abstract class BarcodeEvent {
  const BarcodeEvent();

  List<Object> get props => [];
}

class InitBarcodeBoxEvent extends BarcodeEvent {}

class FetchAllBarcodesEvent extends BarcodeEvent {}

class AddBarcodeEvent extends BarcodeEvent {
  final Barcode barcode;
  const AddBarcodeEvent({
    required this.barcode,
  });
}

class RemoveBarcodeEvent extends BarcodeEvent {
  final String barcode;
  const RemoveBarcodeEvent({
    required this.barcode,
  });
}
