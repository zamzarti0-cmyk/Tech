import 'package:flutter/material.dart';
import 'package:holistq/features/auth/presentation/splash_screen.dart';

class AuthFlow extends StatelessWidget {
  const AuthFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

class AuthRoutes {
  static const splash = '/splash';
  static const welcome = '/welcome';
  static const signIn = '/sign-in';
  static const createAccount = '/create-account';
  static const profileSetup = '/profile-setup';
}
