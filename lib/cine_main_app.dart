import 'package:cinebox/ui/core/themes/theme.dart';
import 'package:cinebox/ui/home/home_screen.dart';
import 'package:cinebox/ui/movie_detail/movie_detail_screen.dart';
import 'package:cinebox/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class CineMainApp extends StatelessWidget {
  const CineMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineBox',
      theme: AppTheme.theme,
      routes: {
        '/': (_) => SplashScreen(),
        '/home': (_) => HomeScreen(),
        '/movie_detail': (_) => MovieDetailScreen(),
      },
    );
  }
}
