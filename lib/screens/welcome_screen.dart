import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_flutter_2025/screens/login_screen.dart';
import 'package:flash_chat_flutter_2025/screens/registration_screen.dart';
import 'package:flash_chat_flutter_2025/components/roundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Color?> _bg; // background color tween

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this, // ticker from this State
    );

    _bg = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(_controller);

    // Repaint on each tick
    _controller.addListener(() => setState(() {}));

    // Run once (0.0 -> 1.0)
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // always dispose controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg.value ?? Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    totalRepeatCount: 1,
                    pause: Duration.zero,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash Chat',
                        textStyle: const TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                        ),
                        speed: const Duration(milliseconds: 120),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48.0),
            RoundedButton(
              title: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: () =>
                  Navigator.pushNamed(context, RegistrationScreen.id),
            ),
          ],
        ),
      ),
    );
  }
}
