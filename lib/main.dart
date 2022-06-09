import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:flutter_provider/provider/favourite_provider.dart';
import 'package:flutter_provider/provider/slider_provider.dart';
import 'package:flutter_provider/provider/theme_changer_provider.dart';
import 'package:flutter_provider/screen/dark_mode/dark_theme_page.dart';
import 'package:flutter_provider/screen/favourite/favourite_page.dart';
import 'package:flutter_provider/screen/home_page.dart';
import 'package:flutter_provider/screen/slider_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Provider State Management',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              iconTheme: const IconThemeData(
                color: Colors.red,
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.green,
              )
            ),
            home: const DarkThemePage(),
          );
        },
      )
    );
  }
}
