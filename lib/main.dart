import 'package:flutter/material.dart';
import 'package:wwdc/views/HomeView.dart';





const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

double elevation = 2.0;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    timeDilation = 10.0;
    return MaterialApp(
      theme: ThemeData(
        iconTheme: Theme.of(context).iconTheme,
        brightness: Brightness.light,
        primaryColor: white,
        accentColor: Colors.cyan[600],
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}


