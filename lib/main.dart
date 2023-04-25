//import 'package:copyappfresh/widgets/login_widget.dart';
import 'package:copyappfresh/screens/launch_screen.dart';
import 'package:copyappfresh/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(const CopyAppFresh());
}

class CopyAppFresh extends StatelessWidget {
  const CopyAppFresh({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Copy App Fresh',
      //theme: ThemeData(
      //  primarySwatch: Colors.blue,
      //),
      routes: {
        "/": (context) => const LaunchScreen(),
        "/login" : (context) => const LoginScreen(),
      },
      initialRoute: "/",
    );
  }
}