import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:multi_score/main_screens/supplier_home.dart';
import 'package:multi_score/widgets/blue_button.dart';

const textColors = [
  Colors.blueAccent,
  Colors.white,
  Colors.lightBlueAccent,
  Colors.blueAccent,
  Colors.blue
];

const textStyle =
    TextStyle(fontSize: 45, fontWeight: FontWeight.bold, fontFamily: 'Acme');

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/inapp/bgimage.jpg'),
                fit: BoxFit.cover)),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Welcome',
                    textStyle: textStyle,
                    colors: textColors,
                  ),
                  ColorizeAnimatedText(
                    'Hardik\'s Store',
                    textStyle: textStyle,
                    colors: textColors,
                  )
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
              /*const Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),*/
              const SizedBox(
                height: 120,
                width: 200,
                child: Image(image: AssetImage('images/inapp/logo.jpg')),
              ),
              SizedBox(
                height: 100,
                child: DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Acme'),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('We make online '),
                      TyperAnimatedText('selling superbly easy'),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50))),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Suppliers Only',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Animatedlogo(controller: _controller),
                            BlueButton(
                                label: 'Log In',
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/supplier_home');
                                },
                                width: 0.25),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: BlueButton(
                                  label: 'Sign Up',
                                  onPressed: () {},
                                  width: 0.25),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: BlueButton(
                              label: 'Log In',
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/customer_home');
                              },
                              width: 0.25),
                        ),
                        BlueButton(
                            label: 'Sign Up',
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/customer_signup');
                            },
                            width: 0.25),
                        Animatedlogo(controller: _controller),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white38.withOpacity(0.4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleFacebookLogin(
                        label: 'Google',
                        onPressed: () {},
                        child: const Image(
                            image: AssetImage('images/inapp/google.jpg')),
                      ),
                      GoogleFacebookLogin(
                        label: 'Facebook',
                        onPressed: () {},
                        child: const Image(
                            image: AssetImage('images/inapp/facebook.jpg')),
                      ),
                      GoogleFacebookLogin(
                        label: 'Guest',
                        onPressed: () async{
                        },
                        child: const Icon(
                          Icons.person,
                          size: 55,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Animatedlogo extends StatelessWidget {
  const Animatedlogo({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller.view,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * pi,
            child: child,
          );
        },
        child: const Image(image: AssetImage('images/inapp/logo.jpg')));
  }
}

class GoogleFacebookLogin extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Widget child;
  const GoogleFacebookLogin(
      {super.key,
      required this.child,
      required this.label,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            SizedBox(height: 50, width: 50, child: child),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
