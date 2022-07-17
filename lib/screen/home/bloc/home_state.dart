// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingBarcodes extends HomeState {}

class BarcodesLoaded extends HomeState {
  final List<Barcode> barcodes;
  BarcodesLoaded({
    required this.barcodes,
  });
}

class HomeError extends HomeState {
  final String error;
  HomeError({
    required this.error,
  });
}
