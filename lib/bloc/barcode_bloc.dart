// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:barcode_scaner/data/models/barcode.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:barcode_scaner/data/repository.dart';

part 'barcode_event.dart';
part 'barcode_state.dart';

class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  final BarcodeRepository repository;

  BarcodeBloc({required this.repository}) : super(BarcodeInitial()) {
    on<FetchAllBarcodesEvent>(_fetchAllBarcodes);
    on<AddBarcodeEvent>(_addNewBarcode);
    on<RemoveBarcodeEvent>(_removeBarcode);
    on<InitBarcodeBoxEvent>(_initBarcodeBox);
  }

  FutureOr<void> _initBarcodeBox(
      InitBarcodeBoxEvent event, Emitter<BarcodeState> emit) async {
    await repository.init();
  }

  FutureOr<void> _fetchAllBarcodes(
      FetchAllBarcodesEvent event, Emitter<BarcodeState> emit) async {
    try {
      emit(LoadingBarc());
      final barcodes = repository.getBarcodes();
      emit(BarcodesLoaded(barcodes: barcodes));
    } catch (e) {
      emit(const BarcodesError(error: "Unable to load barcode"));
    }
  }

  FutureOr<void> _addNewBarcode(
      AddBarcodeEvent event, Emitter<BarcodeState> emit) async {
    try {
      emit(LoadingBarc());
      await repository.addBarcode(event.barcode).then((bList) {
        emit(BarcodesLoaded(barcodes: bList));
      });
    } catch (e) {
      emit(const BarcodesError(error: "Unable to add new barcode"));
    }
  }

  FutureOr<void> _removeBarcode(
      RemoveBarcodeEvent event, Emitter<BarcodeState> emit) async {
    try {
      emit(LoadingBarc());
      await repository.removeBarcode(event.barcode).then((bList) {
        emit(BarcodesLoaded(barcodes: bList));
      });
    } catch (e) {
      emit(const BarcodesError(error: "Unable to remove barcode"));
    }
  }
}
