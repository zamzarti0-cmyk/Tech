import 'package:go_router/go_router.dart';
import 'package:holistq/features/auth/presentation/create_account_screen.dart';
import 'package:holistq/features/auth/presentation/profile_setup_screen.dart';
import 'package:holistq/features/auth/presentation/sign_in_screen.dart';
import 'package:holistq/features/auth/presentation/splash_screen.dart';
import 'package:holistq/features/auth/presentation/welcome_screen.dart';

final authRoutes = [
  GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
  GoRoute(path: '/welcome', builder: (context, state) => const WelcomeScreen()),
  GoRoute(path: '/sign-in', builder: (context, state) => const SignInScreen()),
  GoRoute(path: '/create-account', builder: (context, state) => const CreateAccountScreen()),
  GoRoute(path: '/profile-setup', builder: (context, state) => const ProfileSetupScreen()),
];
