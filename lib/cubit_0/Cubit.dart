import 'package:bloc/bloc.dart';

enum ScreenOption { wifi, bluetooth, notifications, display, security, about }

class ScreenState {
  final ScreenOption? selectedOption;
  final String? screen2Data;

  ScreenState({this.selectedOption, this.screen2Data});
}

class ScreenCubit extends Cubit<ScreenState> {
  ScreenCubit() : super(ScreenState());

  void updateSelectedOption(ScreenOption option) {
    emit(ScreenState(selectedOption: option, screen2Data: state.screen2Data));
  }

  void sendDataToScreen3(String data) {
    emit(ScreenState(selectedOption: state.selectedOption, screen2Data: data));
  }
}
