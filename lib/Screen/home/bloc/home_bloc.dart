// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import 'package:barcode_scaner/data/repository.dart';

import '../../../data/models/barcode.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BarcodeRepository repository;
  HomeBloc({
    required this.repository,
  }) : super(HomeInitial()) {
    on<FetchAllBarcodesEvt>(_fetchAllBarcode);
    on<RemoveBarcodeEvt>(_removeBarcode);
    on<InitBarcodeBoxEvt>(_initBarcodeBox);
  }

  FutureOr<void> _initBarcodeBox(
      InitBarcodeBoxEvt event, Emitter<HomeState> emit) async {
    await repository.init();
    add(FetchAllBarcodesEvt());
  }

  FutureOr<void> _fetchAllBarcode(
      FetchAllBarcodesEvt event, Emitter<HomeState> emit) async {
    try {
      emit(LoadingBarcodes());
      final barcodes = repository.getBarcodes();
      emit(BarcodesLoaded(barcodes: barcodes));
    } catch (e) {
      emit(HomeError(error: "Unable to load barcode"));
    }
  }

  FutureOr<void> _removeBarcode(
      RemoveBarcodeEvt event, Emitter<HomeState> emit) async {
    try {
      await repository.removeBarcode(event.id).then((bList) {
        emit(BarcodesLoaded(barcodes: bList));
      });
    } catch (e) {
      emit(HomeError(error: "Unable to remove barcode"));
    }
  }
}
