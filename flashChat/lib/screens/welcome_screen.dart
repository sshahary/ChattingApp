import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flashchat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(vsync: this,
      duration: const Duration(seconds: 2)
    );
    controller.forward();
    animation = ColorTween(
        begin: Colors.greenAccent,
        end: Colors.pinkAccent).animate(controller);
    controller.addListener(() {setState(() {});});
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  width: 280,

                  child: TextLiquidFill(
                    text: 'Faltu Chat',
                    waveColor: Colors.blueAccent,
                    boxBackgroundColor: Colors.white,
                    boxHeight: 100,
                    textStyle: const TextStyle(
                      fontSize: 55.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                ),
              ],
            ),
            const SizedBox(
              height:45.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: (){
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              colour: Colors.blueAccent,
              title: 'Register',
              onPressed: (){
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

