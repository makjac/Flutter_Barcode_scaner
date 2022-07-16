import 'package:barcode_scaner/data/models/barcode.dart';
import 'package:barcode_scaner/screen/scaner/bloc/scaner_bloc.dart';
import 'package:barcode_scaner/screen/scaner/widget/scaner_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class Scaner extends StatelessWidget {
  const Scaner({Key? key}) : super(key: key);

  String _idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanerBloc, ScanerState>(
      builder: (context, state) {
        if (state is ScanningBarcode) {
          return QRBarScannerCamera(
            onError: ((context, error) => Center(
                  child: Text(
                    error.toString(),
                    style: const TextStyle(color: Colors.red, fontSize: 20),
                  ),
                )),
            qrCodeCallback: (code) => {
              if (code != null)
                {
                  // BlocProvider.of<ScanerBloc>(context).add(AddBarcodeEvt(
                  //     barcode: Barcode(
                  //         id: _idGenerator(),
                  //         barcode: code,
                  //         date: DateTime.now())))
                }
            },
            fit: BoxFit.fill,
            child: const ScanerDecoration(),
          );
        }

        if (state is ReadingBarcode) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is BarcodeScaned) {
          return const Center(
            child: Text("Scaned"),
          );
        }

        return Container();
      },
    );
  }
}
