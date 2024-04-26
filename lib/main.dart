import 'package:flutter/material.dart';
import 'package:multi_score/auth/customer_signup.dart';
import 'package:multi_score/main_screens/customer_home.dart';
import 'package:multi_score/main_screens/supplier_home.dart';
import 'package:multi_score/main_screens/welcome_screen.dart';

 void main()async
{
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: WelcomeScreen(),
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen':(context) => const WelcomeScreen(),
        '/customer_home':(context) => const CustomerHomeScreen(),
        '/supplier_home':(context) => const SupplierHomeScreen(),
        '/customer_signup':(context) => const CustomerRagister(),
      },
    );
  }
}
