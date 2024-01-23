import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:gap/gap.dart';
import 'package:speak_sphere/constants/asset_strings.dart';
import 'package:speak_sphere/constants/colors.dart';
import 'package:speak_sphere/constants/edge_insets.dart';
import 'package:speak_sphere/presentation/widgets/custom_filled_button.dart';
import 'package:speak_sphere/presentation/widgets/fixed_bottom_layout.dart';

class SpeakingPage extends StatelessWidget {
  const SpeakingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
                padding: defaultPadding,
                child: FixedBottomLayout(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 15,
                      color: AppColors.black,
                    )),
                const Gap(8),
                Expanded(
                    child: LinearProgressIndicator(
                    minHeight: 10,
                    backgroundColor: AppColors.gray,
                    color: AppColors.primary,
                    value: 0.6,
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ],
            ),
            const Gap(25),
            Text(
              'Speak this sentence',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color.fromRGBO(97, 97, 97, 1),
                  fontWeight: FontWeight.w600),
            ),
            const Gap(30),
            Center(
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primary),
                child: Image.asset(Assets.volume),
              ),
            ),
            const Gap(30),
            Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Bonjour, Buchi, enchante',
                    textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    color: const Color.fromRGBO(97, 97, 97, 1),
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline),
                    speed: const Duration(milliseconds: 150),
                  ),
                ],
                totalRepeatCount: 1,
                displayFullTextOnTap: false,
                stopPauseOnTap: false,
              ),
            ),
            const Spacer(),
            Center(child: Image.asset(Assets.microphone)),
            const Spacer(),
            Text(
              'Brilliant!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    color: const Color.fromRGBO(97, 97, 97, 1),
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const Gap(10),
            Text(
              'Meaning:',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: const Color.fromRGBO(97, 97, 97, 1),
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const Gap(10),
            Text(
              'Hello, Buchi, nice to meet you.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: const Color.fromRGBO(97, 97, 97, 1),
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const Gap(30),
            CustomFilledButton(
              title: 'Continue',
              onPressed: () => context.pop(),
            ),
          ],
                )
                ),
              ),
        ));
  }
}
