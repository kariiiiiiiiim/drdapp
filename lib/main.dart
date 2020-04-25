import 'package:flutter/material.dart';
import 'screens/welcomeScreen.dart';
import 'screens/loginPage.dart';
import 'screens/registerScreen.dart';
import 'screens/profileScreen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        Profile.id: (context) => Profile(),



      }
      ,
    );
  }
}
