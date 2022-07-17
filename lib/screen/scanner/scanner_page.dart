import 'package:barcode_scaner/constans/strings.dart';
import 'package:barcode_scaner/screen/scanner/widget/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:barcode_scaner/data/repository.dart';
import 'package:barcode_scaner/screen/scanner/bloc/scanner_bloc.dart';

import 'bloc/scanner_bloc.dart';

class ScannerPage extends StatefulWidget {
  final BarcodeRepository repository;
  const ScannerPage({
    Key? key,
    required this.repository,
  }) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  late ScannerBloc _scanerBloc;

  @override
  void initState() {
    super.initState();
    _scanerBloc = ScannerBloc(repository: widget.repository);
    _scanerBloc.add(InitScanningEvt());
  }

  @override
  void dispose() {
    _scanerBloc.close();
    super.dispose();
  }

  @override
  Widget build(_) {
    return BlocProvider(
      create: (context) => _scanerBloc,
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Scaner"),
            centerTitle: true,
          ),
          body: BlocListener<ScannerBloc, ScannerState>(
            listener: (ctx, state) {
              if (state is BarcodeScanned) {
                Navigator.pushNamedAndRemoveUntil(
                    context, HOME_ROUTE, (Route<dynamic> route) => false);
              }
              if (state is ScannerError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.teal,
                ));
              }
            },
            child: Scanner(),
          ),
        ),
      ),
    );
  }
}
