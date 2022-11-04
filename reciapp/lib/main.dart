import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/login_support/check_auth.dart';
import 'package:reciapp/login_support/user_preference.dart';
import 'package:reciapp/object/filter_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import '../login_support/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserInfoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CookingMethodsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecipesProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: 'Inter',
        ),
        home: AuthService().handleAuthState(),
      ),
    );
  }
}
