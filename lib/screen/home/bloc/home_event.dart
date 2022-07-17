// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class InitBarcodeBoxEvt extends HomeEvent {}

class CloseBarcodeBoxEvt extends HomeEvent {}

class FetchAllBarcodesEvt extends HomeEvent {}

class RemoveBarcodeEvt extends HomeEvent {
  final String id;
  RemoveBarcodeEvt({
    required this.id,
  });
}
