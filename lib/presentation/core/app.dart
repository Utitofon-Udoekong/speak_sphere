import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speak_sphere/constants/colors.dart';
import 'package:speak_sphere/presentation/router/router.dart';

class AppBuilder extends StatelessWidget{
  const AppBuilder({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      title: 'Speak Sphere',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.background, background: AppColors.background),
          textTheme: GoogleFonts.josefinSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.background),
          useMaterial3: true,
        ),
    );
  }
}