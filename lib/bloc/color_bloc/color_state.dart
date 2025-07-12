part of 'color_bloc.dart';

@immutable
sealed class ColorState {
  Color get backgroundColor;
}

final class ColorInitial extends ColorState {
  @override
  final Color backgroundColor = Colors.blue;
}

final class ColorChanged extends ColorState {
  final Color _backgroundColor;

  ColorChanged(this._backgroundColor);

  @override
  Color get backgroundColor => _backgroundColor;
}