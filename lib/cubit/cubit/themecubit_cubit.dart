import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'themecubit_state.dart';

class ThemecubitCubit extends Cubit<ThmCubState> {
  ThemecubitCubit() : super(ThemeCubInit());

  void countheme(ThemeMode themeMode) {
    emit(ThemeCounted(currentTheme: themeMode));
  }

  void changeTheme(ThemeMode themeMode) {
    emit(ThmChange(curr_Thm: themeMode));
  }
}
