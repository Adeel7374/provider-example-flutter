import 'package:flutter/material.dart';
import 'package:myproject/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeChangerScreen extends StatefulWidget {
  const ThemeChangerScreen({super.key});

  @override
  State<ThemeChangerScreen> createState() => _ThemeChangerScreenState();
}

class _ThemeChangerScreenState extends State<ThemeChangerScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Theme'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: const Text('Light Mode'),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: const Text('Dark Mode'),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: const Text('System Mode'),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
        ],
      ),
    );
  }
}
