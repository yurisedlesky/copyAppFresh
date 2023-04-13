import 'package:flutter/material.dart';

class LaunchWidget extends StatelessWidget {
  LaunchWidget({Key? key}) : super(key: key);

  final HelloWords _helloWords = HelloWords();

  final DateTime _time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image2.png"),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LaunchTextWidget(launchText: _helloWords.getHelloKz(_helloWords._getIndex(_time)) ),
            const SizedBox(height: 30,),
            LaunchTextWidget(launchText: _helloWords.getHelloRu(_helloWords._getIndex(_time)) ),
            const SizedBox(height: 30,),
            LaunchTextWidget(launchText: _helloWords.getHelloEn(_helloWords._getIndex(_time)) ),
          ],
        ),
      ),
    );
  }
}

class HelloWords{
  List<String> helloRu = ['Доброй ночи','Доброе утро','Добрый день','Добрый вечер'];
  List<String> helloKz = ['Қайырлы түн','Қайырлы таң','Қайырлы күн','Қайырлы кеш'];
  List<String> helloEn = ['Good night','Good morning','Good afternoon','Good evening'];

  int _getIndex(DateTime t){
    if (t.hour >= 0 && t.hour<6) {return 0;}
    else if(t.hour >= 6 && t.hour<12) {return 1;}
    else if(t.hour >= 12 && t.hour<18) {return 2;}
    else if(t.hour >= 18 && t.hour <= 23) {return 3;}
    else {return 2;}
  }

  String getHelloKz(int i){
    return helloKz[i];
  }
  String getHelloRu(int i){
    return helloRu[i];
  }
  String getHelloEn(int i){
    return helloEn[i];
  }
}

class LaunchTextWidget extends StatelessWidget {
  final String? launchText;
  const LaunchTextWidget({Key? key, required this.launchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      launchText!,
      style: const TextStyle(
        fontSize: 34,
        fontFamily: 'Brushtype',
        letterSpacing: 4.0,
        color: Colors.lightGreenAccent,
        decoration:
        TextDecoration.none,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(5.0, 5.0),
            blurRadius: 8.0,
            color: Color.fromARGB(255, 0, 0, 0),
          )],),
    );
  }
}
