import 'package:copyappfresh/screens/login_screen.dart';
import 'package:copyappfresh/widgets/launch_widget.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  void toLogin() async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
  }

  @override
  void initState() {
    super.initState();

    // will load static to cache {}

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: LaunchWidget(),
    );
  }
}
