import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:holistq/features/auth/presentation/auth_router.dart';
import 'package:holistq/features/home/presentation/home_screen.dart';
import 'package:holistq/features/home/presentation/home_shell.dart';
import 'package:holistq/features/fitness/presentation/fitness_screen.dart';
import 'package:holistq/features/nutrition/presentation/nutrition_screen.dart';
import 'package:holistq/features/wellness/presentation/wellness_screen.dart';
import 'package:holistq/features/profile/presentation/profile_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      ...authRoutes,
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/fitness', builder: (context, state) => const FitnessScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/nutrition', builder: (context, state) => const NutritionScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/wellness', builder: (context, state) => const WellnessScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/profile', builder: (context, state) => const ProfileScreen()),
            ],
          ),
        ],
      ),
    ],
  );
});
