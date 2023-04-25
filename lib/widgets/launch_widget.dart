import 'package:flutter/material.dart';

bool isMove = true;

class LaunchWidget extends StatefulWidget {
  const LaunchWidget({Key? key}) : super(key: key);

  @override
  State<LaunchWidget> createState() => _LaunchWidgetState();
}

class _LaunchWidgetState extends State<LaunchWidget> {
  final HelloWords _helloWords = HelloWords();

  final DateTime _time = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       setState(() {
         isMove = !isMove;
       });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.teal,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
         image: DecorationImage(
             image: AssetImage("assets/image2.png"),
             fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Container(
            height: MediaQuery.of(context).size.height/3,
              //color: Colors.white38,
              width: double.infinity,
              child: const AnimatedLogo()),
          Expanded(
            //padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LaunchTextWidget(launchText: _helloWords.getHelloKz(_helloWords._getIndex(_time)) ),
                const SizedBox(height: 30,),
                LaunchTextWidget(launchText: _helloWords.getHelloRu(_helloWords._getIndex(_time)) ),
                const SizedBox(height: 30,),
                LaunchTextWidget(launchText: _helloWords.getHelloEn(_helloWords._getIndex(_time)) ),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({Key? key}) : super(key: key);

  @override //Image.asset("assets/logo.png"),
  Widget build(BuildContext context) {
    return  AnimatedAlign(
          alignment: isMove ? Alignment.topLeft : Alignment.bottomCenter,
          duration: const Duration(seconds: 2),
          heightFactor: 0.5,
          widthFactor: 0.5,
          curve: Curves.fastOutSlowIn,
          child: Image.asset("assets/LogoAF.png"),
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
        color: Colors.white,
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
