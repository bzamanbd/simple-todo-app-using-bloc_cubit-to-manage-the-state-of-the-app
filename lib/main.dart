import 'package:flutter/material.dart';
import 'package:todos_bloc_cubit/cubit/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'todos',
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.orange,
    ),
    home: BlocProvider(
      create: (context) => TodoCubit(),
      child: const HomeScreen(),
    ),
  ));
}
