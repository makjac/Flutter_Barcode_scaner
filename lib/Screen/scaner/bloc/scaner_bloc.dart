// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:barcode_scaner/data/models/barcode.dart';
import 'package:barcode_scaner/data/repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'scaner_event.dart';
part 'scaner_state.dart';

class ScanerBloc extends Bloc<ScanerEvent, ScanerState> {
  final BarcodeRepository repository;

  ScanerBloc({
    required this.repository,
  }) : super(ScanerInitial()) {
    on<AddBarcodeEvt>(_addBarcode);
  }

  FutureOr<void> _addBarcode(
      AddBarcodeEvt event, Emitter<ScanerState> emit) async {
    try {
      await repository.addBarcode(event.barcode).then((bList) {
        emit(BarcodeScaned());
      });
    } catch (e) {
      emit(ScanerError(error: "Unable to load barcode"));
    }
  }
}
