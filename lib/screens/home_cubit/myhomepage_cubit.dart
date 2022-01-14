import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
part 'myhomepage_state.dart';

class MyhomepageCubit extends Cubit<MyhomepageState> {
  StreamSubscription? subscription;
  bool? _connected;
  MyhomepageCubit(a) : super(MyhomepageInitial()) {
    final SimpleConnectionChecker _simpleConnectionChecker =
        SimpleConnectionChecker()
          ..setLookUpAddress(
              'pub.dev'); //Optional method to pass the lookup string
    subscription =
        _simpleConnectionChecker.onConnectionChange.listen((connected) {
      _connected = connected;
      if (_connected!) {
        emit(a);
      } else {
        emit(CheckInternet());
      }
    });
  }
}
