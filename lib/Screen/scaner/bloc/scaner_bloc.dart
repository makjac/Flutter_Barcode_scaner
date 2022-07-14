import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'scaner_event.dart';
part 'scaner_state.dart';

class ScanerBloc extends Bloc<ScanerEvent, ScanerState> {
  ScanerBloc() : super(ScanerInitial()) {
    on<ScanerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
