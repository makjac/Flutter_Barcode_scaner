// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

import 'package:barcode_scaner/data/models/barcode.dart';
import 'package:barcode_scaner/screen/scanner/widget/scanner_decoration.dart';

import '../bloc/scanner_bloc.dart';

// ignore: must_be_immutable
class Scanner extends StatelessWidget {
  bool _scanerFocus = true;

  Scanner({
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
        BlocProvider.of<ScannerBloc>(context).add(AddBarcodeEvt(
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
      child: const ScannerDecoration(),
    );
  }
}
