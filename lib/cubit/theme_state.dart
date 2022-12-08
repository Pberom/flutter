part of 'theme_cubit.dart';

@immutable
abstract class ThmCubState {}

class ThmCubInit extends ThmCubState {
  ThmCubInit();
}

class ThmModeChngState extends ThmCubState {
  ThemeMode currentTheme;
  ThmModeChngState({
    required this.currentTheme,
  });
}

class ThemeValueAddedState extends ThmCubState {
  ThemeMode currentTheme;
  int currentValue;
  ThemeValueAddedState(
      {required this.currentTheme, required this.currentValue});
}
