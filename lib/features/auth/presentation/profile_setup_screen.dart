import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create profile')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text('Tell us a bit about you', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text('We use this to tailor your workouts, meals, and wellness plan.'),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: 'Username')),
            const SizedBox(height: 12),
            const TextField(decoration: InputDecoration(labelText: 'Height (cm)')),
            const SizedBox(height: 12),
            const TextField(decoration: InputDecoration(labelText: 'Weight (kg)')),
            const SizedBox(height: 24),
            FilledButton(onPressed: () {}, child: const Text('Continue')),
          ],
        ),
      ),
    );
  }
}
