import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  final Random _random = Random();
  ColorBloc() : super(ColorInitial()) {
    on<ChangeColorEvent>((event, emit) {
      emit(ColorChanged(_generateCustomColor()));
    });

  }
  Color _generateCustomColor() {
    return Color.fromRGBO(_random.nextInt(255), _random.nextInt(255), _random.nextInt(255), 1);
  }
}
