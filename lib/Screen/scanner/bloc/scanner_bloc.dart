// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:barcode_scaner/data/models/barcode.dart';
import 'package:barcode_scaner/data/repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  final BarcodeRepository repository;

  ScannerBloc({
    required this.repository,
  }) : super(ScannerInitial()) {
    on<AddBarcodeEvt>(_addBarcode);
    on<InitScanningEvt>(_initScaning);
  }

  FutureOr<void> _initScaning(
      InitScanningEvt event, Emitter<ScannerState> emit) async {
    //await repository.init();
    emit(ScanningBarcode());
  }

  FutureOr<void> _addBarcode(
      AddBarcodeEvt event, Emitter<ScannerState> emit) async {
    try {
      await repository.addBarcode(event.barcode);
      emit(BarcodeScanned());
    } catch (e) {
      emit(ScannerError(error: "Unable to load barcode"));
    }
  }
}
