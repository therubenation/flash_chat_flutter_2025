import 'package:flash_chat_flutter_2025/screens/login_screen.dart';
import 'package:flash_chat_flutter_2025/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// adding a ticker (ingredient for animation)
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // adding animation controller
  late final AnimationController _controller;
  late final Animation<double> _animation; // 0.0 to 1.0 (eased)

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    // curves use values from 0 to 1
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward(); // forward() starts the animation from 0.0 to 1.0
    //_controller.reverse(from: 1.0); // reverse() starts the animation from 1.0 to 0.0

    _controller.addListener(() {
      setState(() {}); // without this animation would not work
      print(_animation.value);
    });

    // L171: adding status listener to check animation status
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(from: 1.0);
      }
    });
  }

  // after animation: always dispose controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: _animation.value * 100,
                  ),
                ),
                Text(
                  'Flash Chat', //'${controller.value.toInt()}',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
