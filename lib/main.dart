import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:investerings_kalkulator/state_provider.dart';
import 'package:investerings_kalkulator/homepage.dart';

// DESKTOP-ANQ9GM5

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background5.png"),
                fit: BoxFit.fitWidth)),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => InputProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => InputCalcProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => BeforeAfterProvider(),
            ),
          ],
          child: MaterialApp(
            title: 'Investerings Kalkulator',
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: _locale,
            supportedLocales: const [
              Locale('nb', ''),
            ],
            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: MyHomePage(),
          ),
        ),
      ),
    );
  }
}
