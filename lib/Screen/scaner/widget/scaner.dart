import 'package:barcode_scaner/data/models/barcode.dart';
import 'package:barcode_scaner/screen/scaner/bloc/scaner_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class Scaner extends StatelessWidget {
  const Scaner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QRBarScannerCamera(
      onError: ((context, error) => Center(
            child: Text(
              error.toString(),
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
          )),
      qrCodeCallback: (code) {
        if (code != null) {
          BlocProvider.of<ScanerBloc>(context).add(AddBarcodeEvt(
              barcode: Barcode(id: "id", barcode: code, date: DateTime.now())));
        }
      },
      fit: BoxFit.fill,
      child: _scaningBox(),
    );
  }
}

Widget _scaningBox() {
  const boxSize = 200.0;

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Scan barcode",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: boxSize,
          width: boxSize,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 3),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ],
    ),
  );
}
