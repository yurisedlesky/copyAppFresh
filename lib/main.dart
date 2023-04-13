//import 'package:copyappfresh/widgets/auth_widget.dart';
import 'package:copyappfresh/widgets/launch_widget.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(const CopyAppFresh());
}

class CopyAppFresh extends StatelessWidget {
  const CopyAppFresh({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Copy App Fresh',
      //theme: ThemeData(
      //  primarySwatch: Colors.blue,
      //),
      routes: {
        "/": (context) => LaunchWidget(),
      },
      initialRoute: "/",
    );
  }
}