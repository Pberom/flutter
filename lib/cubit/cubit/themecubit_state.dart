part of 'themecubit_cubit.dart';

@immutable
abstract class ThmCubState {}

class ThemeCubInit extends ThmCubState {}

class ThmChange extends ThmCubState {
  ThemeMode curr_Thm;
  ThmChange({
    required this.curr_Thm,
  });
}

class ThemeCounted extends ThmCubState {
  ThemeMode currentTheme;
  late int valAdd;
  ThemeCounted({
    required this.currentTheme,
  }) {
    if (currentTheme == ThemeMode.dark)
      valAdd = 2;
    else
      valAdd = 1;
  }
}
