import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Profile & Community', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text('Personal profile, community, saved items, settings, and coach mode will live here.'),
        ],
      ),
    );
  }
}
