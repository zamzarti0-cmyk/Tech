import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text('Welcome to HolistQ', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 12),
              Text(
                'Your all-in-one fitness, nutrition, wellness, and lifestyle companion.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Personalized workouts', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 8),
                        Text('Smart nutrition, AI coaching, habit building, and progress tracking.'),
                        const SizedBox(height: 20),
                        Text('Wellness support', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 8),
                        Text('Sleep, mindfulness, stress insights, and better recovery.'),
                      ],
                    ),
                  ),
                ),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.rocket_launch_rounded),
                label: const Text('Get Started'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.login_rounded),
                label: const Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
