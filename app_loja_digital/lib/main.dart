import 'package:app_loja_digital/models/user_manager.dart';
import 'package:app_loja_digital/screens/base/base_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_loja_digital/models/page_manager.dart';

void main() async {
 runApp(
    MultiProvider(
      providers: [
          ListenableProvider<PageController>(
            create: (_) => PageController(
            )),
        ChangeNotifierProxyProvider<PageController, PageManager>(
          create: (context) => PageManager(context.read<PageController>()),
          update: (context, pageController, previous) =>
           previous ?? PageManager(pageController),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      create: (_) => UserManager(),
      debugShowCheckedModeBanner: false,
      title: 'Loja da JU',
      theme: ThemeData(
        primaryColor :  Color.fromARGB(255, 4, 125, 141),
        scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
        appBarTheme: const AppBarTheme(
          elevation: 0
        ),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BaseScreen()
      );
  }
}