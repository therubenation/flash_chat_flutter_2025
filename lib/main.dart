import 'package:flutter/material.dart';
import 'package:flash_chat_flutter_2025/screens/welcome_screen.dart';
import 'package:flash_chat_flutter_2025/screens/login_screen.dart';
import 'package:flash_chat_flutter_2025/screens/chat_screen.dart';
import 'package:flash_chat_flutter_2025/screens/registration_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
    );
  }
}
