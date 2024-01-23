import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_sphere/presentation/pages/home/chat_page.dart';
import 'package:speak_sphere/presentation/pages/home/excercise_page.dart';
import 'package:speak_sphere/presentation/pages/home/games_page.dart';
import 'package:speak_sphere/presentation/pages/home/home_page.dart';
import 'package:speak_sphere/presentation/pages/home/home_shell.dart';
import 'package:speak_sphere/presentation/pages/home/lesson_page.dart';
import 'package:speak_sphere/presentation/pages/home/profile_page.dart';
import 'package:speak_sphere/presentation/pages/home/speaking_page.dart';
import 'package:speak_sphere/presentation/pages/home/streak_page.dart';
import 'package:speak_sphere/presentation/pages/onboarding_screen.dart';
import 'package:speak_sphere/presentation/pages/splash_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();
/// GoRouter page configuration
final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (_,__) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (_,__) => const OnboardingScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child){
        return HomeShell(child: child,);
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (_,__) => const NoTransitionPage(child: HomePage()),
        ),
        GoRoute(
          path: '/lessons',
          pageBuilder: (_,__) => const NoTransitionPage(child: LessonPage()),
        ),
        GoRoute(
          path: '/exercise',
          pageBuilder: (_,__) => const NoTransitionPage(child: ExcercisePage()),
        ),
        GoRoute(
          path: '/games',
          pageBuilder: (_,__) => const NoTransitionPage(child: GamesPage()),
        ),
        GoRoute(
          path: '/chat',
          pageBuilder: (_,__) => const NoTransitionPage(child: ChatPage()),
        ),
      ]
    ),
    GoRoute(
      path: '/profile',
      builder: (_,__) => const ProfilePage(),
    ),
    GoRoute(
      path: '/speaking-page',
      builder: (_,__) => const SpeakingPage(),
    ),
    GoRoute(
      path: '/streak-page',
      builder: (_,__) => const StreakPage(),
    ),
  ],
  debugLogDiagnostics: true,
);
