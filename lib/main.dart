import 'package:flutter/material.dart';
import 'package:flutter_application_4/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode themeMode;
  @override
  void initState() {
    themeMode = ThemeMode.system;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: themeMode,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      title: 'Material App',
      home: BlocProvider(
        create: (context) => CubitCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: NewWidget(
            changeTheme: (p0) {
              setState(() {
                themeMode = p0;
              });
            },
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({Key? key, required this.changeTheme}) : super(key: key);
  final void Function(ThemeMode) changeTheme;
  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  late int valueChet;
  late List<String> history;
  @override
  void initState() {
    valueChet = 0;
    history = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitCubit, CubitState>(
      listener: (context, state) {
        if (state is CubitThemeChanged) {
          widget.changeTheme(state.theme);
          setState(() {
            history.add(
                Theme.of(context).brightness.name + ' ' + valueChet.toString());
          });
          SharedPreferences.getInstance().then((value) {
            value.setInt('value', valueChet);
            value.setStringList('history', history);
            value.setBool(
                'theme', Theme.of(context).brightness == Brightness.light);
          });
        } else if (state is CubitValueChanged) {
          setState(() {
            valueChet = state.chiclo;
            history.add(
                Theme.of(context).brightness.name + ' ' + valueChet.toString());
          });
          SharedPreferences.getInstance().then((value) {
            value.setInt('value', valueChet);
            value.setStringList('history', history);
            value.setBool(
                'theme', Theme.of(context).brightness == Brightness.light);
          });
        }
      },
      child: Column(
        children: [
          Text(valueChet.toString()),
          ElevatedButton(
              child: Icon(Icons.nightlight_round),
              onPressed: () {
                context.read<CubitCubit>().changeTheme(
                    Theme.of(context).brightness == Brightness.light
                        ? ThemeMode.light
                        : ThemeMode.dark);
              }),
          ElevatedButton(
            onPressed: () {
              context.read<CubitCubit>().changeValue(
                  valueChet,
                  Theme.of(context).brightness == Brightness.light
                      ? ThemeMode.light
                      : ThemeMode.dark);
            },
            child: Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CubitCubit>().changeValueMin(
                  valueChet,
                  Theme.of(context).brightness == Brightness.light
                      ? ThemeMode.light
                      : ThemeMode.dark);
            },
            child: Icon(Icons.remove),
          ),
          Expanded(
            child: ListView(
              children: history.map((e) => Text(e)).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              SharedPreferences.getInstance().then((value) {
                value.clear();
              });
              setState(() {
                history.clear();
                valueChet = 0;
              });
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
