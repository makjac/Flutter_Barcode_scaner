import 'package:barcode_scaner/Screen/home/bloc/home_bloc.dart';
import 'package:barcode_scaner/data/models/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarcodeCard extends StatelessWidget {
  final Barcode barcode;
  final int index;

  const BarcodeCard({
    required this.barcode,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            child: Text((index + 1).toString()),
          ),
          const SizedBox(width: 10),
          Text(barcode.barcode),
          const SizedBox(width: 10),
          Text(barcode.date.toString()),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<HomeBloc>(context)
                  .add(RemoveBarcodeEvt(id: barcode.id));
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.delete_forever),
          )
        ],
      ),
    );
  }
}
