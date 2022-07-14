import 'package:barcode_scaner/Constans/strings.dart';
import 'package:barcode_scaner/bloc/barcode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.pushNamed(context, SCAN_PAGE),
          label: const Text("Scan new code"),
          icon: const Icon(Icons.qr_code_scanner),
        ),
        body: BlocBuilder<BarcodeBloc, BarcodeState>(
          builder: (context, state) {
            if (state is LoadingBarc) {
              return const CircularProgressIndicator();
            }
            if (state is BarcodesLoaded) {
              return const Text("hello");
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }
}
