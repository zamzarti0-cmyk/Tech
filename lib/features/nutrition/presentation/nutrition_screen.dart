import 'package:flutter/material.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nutrition')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Nutrition Intelligence', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text('Meal planning, food logging, grocery lists, and hydration insights will live here.'),
        ],
      ),
    );
  }
}
