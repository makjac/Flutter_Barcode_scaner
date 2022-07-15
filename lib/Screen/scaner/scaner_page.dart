// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barcode_scaner/screen/scaner/widget/scaner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:barcode_scaner/data/repository.dart';
import 'package:barcode_scaner/screen/scaner/bloc/scaner_bloc.dart';

class ScanerPage extends StatelessWidget {
  final BarcodeRepository repository;
  const ScanerPage({
    Key? key,
    required this.repository,
  }) : super(key: key);

  @override
  Widget build(_) {
    return BlocProvider(
      create: (context) =>
          ScanerBloc(repository: repository)..add(InitScanningEvt()),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Scaner"),
            centerTitle: true,
          ),
          body: BlocListener<ScanerBloc, ScanerState>(
            listener: (context, state) {
              if (state is BarcodeScaned) {
                print('ehllo');
              }
            },
            child: const Scaner(),
          ),
        ),
      ),
    );
  }
}
