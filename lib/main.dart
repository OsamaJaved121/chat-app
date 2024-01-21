// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_import

//Packages
import 'package:chat_app/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';

//Services
import './services/navigation_service.dart';

//Pages
import './pages/splash_page.dart';
import './pages/login_page.dart';

void main() {
  runApp(
    SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () {
        runApp(
          const MainApp(),
        );
      },
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (BuildContext _context) {
            return AuthenticationProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'ChApp',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.deepOrange,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.deepOrange,
          ),
          colorScheme: const ColorScheme(
            background: Colors.deepOrange,
            primary: Colors.deepOrange,
            secondary: Colors.deepOrange,
            brightness: Brightness.light,
            error: Colors.deepOrange,
            onBackground: Colors.deepOrange,
            onError: Colors.deepOrange,
            onPrimary: Colors.deepOrange,
            surface: Colors.deepOrange,
            onSecondary: Colors.deepOrange,
            onSurface: Colors.deepOrange,
          ),
        ),
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext _context) => const LoginPage(),
        },
      ),
    );
  }
}
