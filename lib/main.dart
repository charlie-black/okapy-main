import 'package:flutter/material.dart';
import 'package:okapy/core/locator.dart';
import 'package:okapy/core/providers.dart';
import 'package:okapy/screens/authentication/login.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/auth.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  determinePosition();
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, authController, child) => MaterialApp(
        title: 'Okapy',
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: themeColorAmber),
              ),
              border: const OutlineInputBorder(),
              labelStyle: TextStyle(color: themeColorAmber, fontSize: 24.0),
            ),
            primarySwatch: Colors.amber,
            fontFamily: 'Rubik'),
        home: const MyHomePage(title: 'Okapy'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Login(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
