// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

import 'package:barcode_scaner/data/models/barcode.dart';
import 'package:barcode_scaner/screen/scaner/bloc/scaner_bloc.dart';
import 'package:barcode_scaner/screen/scaner/widget/scaner_decoration.dart';

class Scaner extends StatelessWidget {
  bool _scanerFocus = true;

  Scaner({
    Key? key,
  }) : super(key: key);

  String _idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  void _qrCodeCallback(String? code, BuildContext context) {
    if (_scanerFocus) {
      _scanerFocus = false;
      if (code != null) {
        BlocProvider.of<ScanerBloc>(context).add(AddBarcodeEvt(
            barcode: Barcode(
                id: _idGenerator(), barcode: code, date: DateTime.now())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return QRBarScannerCamera(
      onError: ((context, error) => Center(
            child: Text(
              error.toString(),
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
          )),
      qrCodeCallback: (code) => {
        _qrCodeCallback(code, context),
      },
      fit: BoxFit.fill,
      child: const ScanerDecoration(),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BlocBuilder<ScanerBloc, ScanerState>(
  //     builder: (context, state) {
  //       if (state is ScanningBarcode) {
  //         return QRBarScannerCamera(
  //           onError: ((context, error) => Center(
  //                 child: Text(
  //                   error.toString(),
  //                   style: const TextStyle(color: Colors.red, fontSize: 20),
  //                 ),
  //               )),
  //           qrCodeCallback: (code) => {
  //             _qrCodeCallback(code, context),
  //           },
  //           fit: BoxFit.fill,
  //           child: const ScanerDecoration(),
  //         );
  //       }

  //       if (state is ReadingBarcode) {
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }

  //       if (state is BarcodeScaned) {
  //         return const Center(
  //           child: Text("Scaned"),
  //         );
  //       }

  //       return Container();
  //     },
  //   );
  // }
}
