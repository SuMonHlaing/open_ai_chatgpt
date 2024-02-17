import 'package:flutter/material.dart';
import 'package:open_ai_chatgpt/authentication/register_screen.dart';
import 'package:open_ai_chatgpt/main_screen/home_screen.dart';
import 'package:open_ai_chatgpt/providers/my_theme_provider.dart';
import 'package:open_ai_chatgpt/themes/my_themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MyThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  void getCurrentTheme() async {
    await Provider.of<MyThemeProvider>(context, listen: false).getThemeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: MyThemes.themeData(
              isDarkTheme: value.themeType, context: context),
          home: const RegisterScreen(),
        );
      },
    );
  }
}
