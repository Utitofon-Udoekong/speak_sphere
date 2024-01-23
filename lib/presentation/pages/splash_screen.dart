import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_sphere/constants/asset_strings.dart';
import 'package:speak_sphere/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(3.seconds,() => context.go('/onboarding'));
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.splash), fit: BoxFit.cover)),
          child: Stack(
            alignment: Alignment.center,
            children: [
            Positioned(
                      top: 40,
                      right: -40,
                      child: Image.asset(
                        Assets.sun,
                      ).animate(
                        onPlay: (controller) => controller.repeat(),
                      )
                      .rotate(duration: 5.seconds)),
            Positioned(
              top: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(Assets.speaker),
                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Speak',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                    )),
                        TextSpan(
                            text: 'Sphere',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    color: AppColors.primary_500,
                                    fontWeight: FontWeight.w600))
                      ])).animate().fadeIn(begin: 0.3, delay: 900.ms, duration: 300.ms),
                      AnimatedTextKit(
                        pause: 1100.ms,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            '', //Just to execute AnimatedTextKit.pause and delay display of Animated text
                            speed: const Duration(milliseconds: 0),
                          ),
                          TypewriterAnimatedText(
                            '...speak the world',
                            cursor: '|',
                            textStyle:
                                Theme.of(context).textTheme.labelSmall?.copyWith(
                                      color: AppColors.primary_500,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic,
                                    ),
                          )
                        ],
                        totalRepeatCount: 1,
                      )
                    ],
                  )
                ],
              ),
            ),
            LayoutBuilder(
              builder: (context, speakerConstraints){
                return Stack(
                  children: [
                      Positioned(
                        left: 0,
                        right: 0,
                      bottom: 70,
                    child: Image.asset(Assets.speakers).animate().fadeIn(delay: 150.ms),
                    ),
                    Positioned(
                      top: 484,
                      left: (speakerConstraints.maxWidth / 2) - 43,
                      child: Image.asset(Assets.voice_1)
                          .animate()
                          .fadeIn(begin: 0, delay: 400.ms),
                    ),
                    Positioned(
                      top: 478,
                      left: (speakerConstraints.maxWidth / 2) - 49,
                      child: Image.asset(Assets.voice_2)
                          .animate()
                          .fadeIn(begin: 0, delay: 600.ms),
                    ),
                    Positioned(
                      top: 370,
                      right: 10,
                      child: Image.asset(Assets.speech_2)
                          .animate()
                          .fadeIn(begin: 0, delay: 800.ms),
                    ),
                    Positioned(
                      top: 385,
                      right: 15,
                      child: Image.asset(Assets.speech_1)
                          .animate()
                          .fadeIn(begin: 0, delay: 900.ms),
                    ),
                  ]
                );
              }
            )
          ]));
        }
      ),
    );
  }
}
