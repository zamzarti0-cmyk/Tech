import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create account')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(decoration: const InputDecoration(labelText: 'Full name')),
              const SizedBox(height: 12),
              TextField(decoration: const InputDecoration(labelText: 'Email')),
              const SizedBox(height: 12),
              TextField(obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
              const SizedBox(height: 20),
              FilledButton(onPressed: () {}, child: const Text('Create account')),
            ],
          ),
        ),
      ),
    );
  }
}
