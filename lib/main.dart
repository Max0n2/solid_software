import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/bloc/color_bloc/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [BlocProvider<ColorBloc>(create: (context) => ColorBloc())],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, ColorState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.backgroundColor,
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.read<ColorBloc>().add(ChangeColorEvent());
            },
            child: Center(
              child: Text(
                'Hey there',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        );
      },
    );
  }
}
