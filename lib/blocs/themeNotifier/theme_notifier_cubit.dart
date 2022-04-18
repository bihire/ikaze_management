import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'theme_notifier_state.dart';

class ThemeNotifierCubit extends Cubit<ThemeNotifierState> {
  final ThemeData? theme;
  ThemeNotifierCubit({required this.theme})
      : super(ThemeNotifierState(theme ?? lightTheme));

  void setLightTheme() => emit(state.copyWith(lightTheme));
  void setDarktTheme() => emit(state.copyWith(darkTheme));
}

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);


