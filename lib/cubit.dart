import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCubit extends Cubit<CubitState> {
  CubitCubit() : super(CubitInitial());
  void changeTheme(ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      emit(CubitThemeChanged(ThemeMode.dark));
    } else {
      emit(CubitThemeChanged(ThemeMode.light));
    }
  }

  void changeValue(int anyint, ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      anyint += 1;
    } else {
      anyint += 2;
    }
    emit(CubitValueChanged(anyint));
  }

  void changeValueMin(int anyintmin, ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      anyintmin -= 1;
    } else {
      anyintmin -= 2;
    }
    emit(CubitValueChanged(anyintmin));
  }
}

abstract class CubitState {}

class CubitInitial extends CubitState {}

class CubitThemeChanged extends CubitState {
  ThemeMode theme;
  CubitThemeChanged(this.theme);
}

class CubitValueChanged extends CubitState {
  int chiclo;
  CubitValueChanged(this.chiclo);
}
