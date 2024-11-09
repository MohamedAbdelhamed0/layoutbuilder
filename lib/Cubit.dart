import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenState {
  final String? screen1Selection;
  final String? screen2Data;

  ScreenState({this.screen1Selection, this.screen2Data});
}

class ScreenCubit extends Cubit<ScreenState> {
  ScreenCubit() : super(ScreenState());

  void updateScreen1Selection(String selection) {
    emit(ScreenState(
        screen1Selection: selection, screen2Data: state.screen2Data));
  }

  void updateScreen2Data(String data) {
    emit(ScreenState(
        screen1Selection: state.screen1Selection, screen2Data: data));
  }
}
