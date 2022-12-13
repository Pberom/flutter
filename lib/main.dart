import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode currentMode;
  @override
  void initState() {
    currentMode = ThemeMode.system;
    SharedPreferences.getInstance().then((value) {
      if (value.containsKey("themeLight")) {
        setState(() {
          currentMode =
              value.getBool("themeLight")! ? ThemeMode.light : ThemeMode.dark;
        });
      } else {
        value.setBool(
            "themeLight", Theme.of(context).brightness == Brightness.light);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: currentMode,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: Scaffold(
        body: FirstScreen(changeTheme: (themeMode) {
          setState(() {
            currentMode = themeMode;
            SharedPreferences.getInstance().then((value) {
              value.setBool("themeLight", currentMode == ThemeMode.light);
            });
          });
        }),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key, required this.changeTheme}) : super(key: key);
  final void Function(ThemeMode) changeTheme;
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      if (value.containsKey("value")) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => SecondScreen(
                    changeTheme: widget.changeTheme,
                  ),
              settings: RouteSettings(arguments: value.getString("value"))),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          child: Icon(Icons.accessible),
          onPressed: () {
            widget.changeTheme(Theme.of(context).brightness == Brightness.light
                ? ThemeMode.dark
                : ThemeMode.light);
          }),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: Icon(Icons.accessible_forward_rounded),
            ),
            SizedBox(
              height: 40,
              child: TextField(
                controller: controller,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    SharedPreferences.getInstance().then((value) {
                      value.setString("value", controller.text);
                    });
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => SecondScreen(
                              changeTheme: widget.changeTheme,
                            ),
                        settings: RouteSettings(arguments: controller.text)),
                  );
                },
                child: Text("Перекат"))
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  SecondScreen({Key? key, required this.changeTheme}) : super(key: key);
  final void Function(ThemeMode) changeTheme;
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: ElevatedButton(
            child: Icon(Icons.accessible_sharp),
            onPressed: () => widget.changeTheme(
                Theme.of(context).brightness == Brightness.light
                    ? ThemeMode.dark
                    : ThemeMode.light)),
        body: Center(
            child:
                Text((ModalRoute.of(context)?.settings.arguments as String))));
  }
}
