import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:investerings_kalkulator/state_provider.dart';
import 'package:investerings_kalkulator/homepage.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                image: AssetImage("assets/images/background7.png"),
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


// final String assetName = 'assets/up_arrow.svg';
// final Widget svgIcon = SvgPicture.asset(
//   assetName,
//   color: Colors.red,
//   semanticsLabel: 'A red up arrow'
// );