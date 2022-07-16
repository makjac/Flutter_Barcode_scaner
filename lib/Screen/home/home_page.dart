import 'package:barcode_scaner/Constans/strings.dart';
import 'package:barcode_scaner/Screen/home/bloc/home_bloc.dart';
import 'package:barcode_scaner/screen/home/widget/barcode_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (ctx, state) {
            if (state is HomeError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (ctx, state) {
            if (state is LoadingBarcodes) {
              return const CircularProgressIndicator();
            }
            if (state is BarcodesLoaded) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return BarcodeCard(
                        barcode: state.barcodes[index], index: index);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: state.barcodes.length);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
