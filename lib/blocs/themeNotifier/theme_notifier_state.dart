part of 'theme_notifier_cubit.dart';

enum ThemeStatus { light, dark }

@immutable
class ThemeNotifierState extends Equatable {
  final ThemeData theme;
  ThemeNotifierState(this.theme);

  ThemeNotifierState copyWith(ThemeData theme) {
    return ThemeNotifierState(theme);
  }
  @override
  List<Object> get props => [theme];
}



