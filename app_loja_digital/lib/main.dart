import 'package:app_loja_digital/models/user_manager.dart';
import 'package:app_loja_digital/screens/base/base_screens.dart';
import 'package:app_loja_digital/screens/base/login/login_screen.dart';
import 'package:app_loja_digital/screens/base/login/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_loja_digital/models/page_manager.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<PageController>(
          create: (_) => PageController(),
        ),
        ChangeNotifierProxyProvider<PageController, PageManager>(
          create: (context) => PageManager(context.read<PageController>()),
          update: (context, pageController, previous) =>
              previous ?? PageManager(pageController),
        ),
        ChangeNotifierProvider<UserManager>(
          create: (_) => UserManager(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loja da JU',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 4, 125, 141),
        scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
        appBarTheme: const AppBarTheme(elevation: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/base',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (_) => LoginScreen());
          case '/signup':
            return MaterialPageRoute(builder: (_) => SignupScreen());
          case '/base':
          default:
            return MaterialPageRoute(builder: (_) => BaseScreen());
        }
      },
    );
  }
}
