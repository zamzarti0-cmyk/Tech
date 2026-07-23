import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(decoration: const InputDecoration(labelText: 'Email')),
              const SizedBox(height: 12),
              TextField(obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
              const SizedBox(height: 20),
              FilledButton(onPressed: () {}, child: const Text('Continue')),
              const SizedBox(height: 12),
              TextButton(onPressed: () {}, child: const Text('Forgot password?')),
            ],
          ),
        ),
      ),
    );
  }
}
