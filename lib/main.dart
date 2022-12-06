import 'package:flutter_application_2/cubit/cubit/themecubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ThemeMode thmMode = ThemeMode.system;
    return BlocProvider(
      create: (ctx) => ThemecubitCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<ThemecubitCubit, ThmCubState>(
          builder: (context, state) {
            if (state is ThmChange) {
              thmMode = state.curr_Thm;
            }

            return MaterialApp(
              theme: ThemeData(
                brightness: Brightness.light,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
              ),
              themeMode: thmMode,
              title: 'Material App',
              home: Scaffold(
                appBar: AppBar(
                  title: Text('Material App Bar'),
                ),
                body: body(),
              ),
            );
          },
        );
      }),
    );
  }
}

class body extends StatefulWidget {
  body({
    Key? key,
  }) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  int currentValue = 0;

  List<String> currentValues = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () => context.read<ThemecubitCubit>().changeTheme(
                    Theme.of(context).brightness == Brightness.light
                        ? ThemeMode.dark
                        : ThemeMode.light),
                child: Text("Сменить тему")),
            ElevatedButton(
                onPressed: () => context.read<ThemecubitCubit>().countheme(
                    Theme.of(context).brightness == Brightness.light
                        ? ThemeMode.light
                        : ThemeMode.dark),
                child: Text("Добавить значение")),
          ],
        ),
        BlocListener<ThemecubitCubit, ThmCubState>(
            listener: (context, state) {
              if (state is ThemeCounted) {
                setState(() {
                  currentValue += state.valAdd;
                  currentValues.add(
                      "Текущая тема - ${state.currentTheme.name}, счёт - ${currentValue.toString()}");
                });
              }
            },
            child: Expanded(
              child: ListView(
                children: currentValues.map((e) => Text(e)).toList(),
              ),
            ))
      ],
    );
  }
}
