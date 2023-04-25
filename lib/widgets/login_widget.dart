import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppBarWidget extends AppBar{
  AppBarWidget({super.key}) : super(
    backgroundColor: Colors.white24,
    elevation: 0.0,
    actions: [TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white24),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        shadowColor: MaterialStateProperty.all(Colors.white24),
      ),
      child: const Icon(Icons.live_help_outlined, color: Colors.black54,),
      onPressed: () {},
    )],
  );
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children:  const [
        LoginTopTextWidget(),
        LoginFormWidget(),
        Spacer(flex: 1,),
        LoginBottomTextWidget(),
        LoginButtonWidget(),
      ],
    );
  }
}

class LoginTopTextWidget extends StatelessWidget {
  const LoginTopTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Привет 👋🏻', style: TextStyle(fontSize: 32, color: Colors.green, fontWeight: FontWeight.bold),),
        SizedBox(height: 15,),
        Text('Введите ваш номер телефона, так мы поймем заказывали ли вы у нас раньше 😉',
            softWrap: true,
            style: TextStyle(fontSize: 18, color: Colors.black54),
            maxLines: 2,
            overflow: TextOverflow.fade,),
        SizedBox(height: 25,)
      ],
    );
  }
}


class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final maskFormatter = MaskTextInputFormatter(
      mask: '(###) ### ## ##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const LoginText2Widget(text: 'Номер телефона',),
              const SizedBox(height: 5,),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(signed: null, decimal: null),
                style: const TextStyle(color: Colors.black54, fontSize: 18,),
                maxLength: 15,
                inputFormatters: [maskFormatter],
                // inputFormatters:<TextInputFormatter>[
                //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                // ],
                decoration:  InputDecoration(
                    prefixText: ' +7 ',
                    fillColor: Colors.black12,
                    filled: true,
                    hintText: 'Номер телефона',
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.green)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.green),
                    ),

                ),
              ),
            ],
    );
  }
}

class LoginBottomTextWidget extends StatelessWidget {
  const LoginBottomTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LoginText2Widget(text: 'Продолжая, вы соглашаетесь с Политикой конфиденциальности и Пользовательским соглашением',),
        SizedBox(height: 15,),
      ],
    );
  }
}

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            style:  ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll<Color>(Colors.green),
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>( RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                //side: const BorderSide(color: Colors.green),
              ) ),
            ),
            onPressed: () {},
            child: const Text('Отправить код', style: TextStyle(fontSize: 18),),
          ),
        ),
      ],
    );
  }
}


class LoginText2Widget extends StatelessWidget {
  final String text;
  const LoginText2Widget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.black54),
      );
  }
}
