import 'package:barcode_scaner/constans/strings.dart';
import 'package:barcode_scaner/screen/scaner/widget/scaner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:barcode_scaner/data/repository.dart';
import 'package:barcode_scaner/screen/scaner/bloc/scaner_bloc.dart';

class ScanerPage extends StatefulWidget {
  final BarcodeRepository repository;
  const ScanerPage({
    Key? key,
    required this.repository,
  }) : super(key: key);

  @override
  State<ScanerPage> createState() => _ScanerPageState();
}

class _ScanerPageState extends State<ScanerPage> {
  late ScanerBloc _scanerBloc;

  @override
  void initState() {
    super.initState();
    _scanerBloc = ScanerBloc(repository: widget.repository);
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
          body: BlocListener<ScanerBloc, ScanerState>(
            listener: (ctx, state) {
              if (state is BarcodeScaned) {
                Navigator.pushNamedAndRemoveUntil(
                    context, HOME_ROUTE, (Route<dynamic> route) => false);
              }
            },
            child: Scaner(),
          ),
        ),
      ),
    );
  }
}
