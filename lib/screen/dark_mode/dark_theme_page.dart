import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class DarkThemePage extends StatefulWidget {
  const DarkThemePage({Key? key}) : super(key: key);

  @override
  State<DarkThemePage> createState() => _DarkThemePageState();
}

class _DarkThemePageState extends State<DarkThemePage> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);
    print("Whole widget rebuild");
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Changer'),centerTitle: true,),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.themeChanger
          ),
          RadioListTile<ThemeMode>(
            title: Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.themeChanger
          ),
          RadioListTile<ThemeMode>(
            title: Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.themeChanger
          ),
          Icon(Icons.favorite),
        ],
      ),
    );
  }
}
