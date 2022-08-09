// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:barcode_scaner/Constans/strings.dart';
import 'package:barcode_scaner/Screen/home/bloc/home_bloc.dart';
import 'package:barcode_scaner/data/repository.dart';
import 'package:barcode_scaner/screen/home/widget/barcode_card.dart';

class HomePage extends StatefulWidget {
  final BarcodeRepository repository;
  const HomePage({
    Key? key,
    required this.repository,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;

  @override
  void initState() {
    _homeBloc = HomeBloc(repository: widget.repository);
    _homeBloc.add(InitBarcodeBoxEvt());
    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _homeBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, SCAN_ROUTE);
          },
          label: const Text("Scan new code"),
          icon: const Icon(Icons.qr_code_scanner),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.teal,
              ));
            }
          },
          builder: (context, state) {
            if (state is LoadingBarcodes) {
              return const CircularProgressIndicator();
            }
            if (state is BarcodesLoaded) {
              return ListView.separated(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 70, left: 5, right: 5),
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
