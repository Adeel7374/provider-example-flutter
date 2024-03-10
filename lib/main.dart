import 'package:flutter/material.dart';
import 'package:myproject/provider/count_provider.dart';
import 'package:myproject/provider/example_one_provider.dart';
import 'package:myproject/provider/fav_provider.dart';
import 'package:myproject/provider/theme_provider.dart';
import 'package:myproject/provider/theme_provider.dart';
import 'package:myproject/screens/example_one_screen.dart';
import 'package:myproject/screens/favourite/fav_screen.dart';
import 'package:myproject/screens/stateful_screen.dart';
import 'package:myproject/screens/theme_changer_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CountProvider(),
          ),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Provider Tutorial',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.orange,
                primaryColor: Colors.orange),
            home: const ThemeChangerScreen(),
          );
        }));
  }
}
