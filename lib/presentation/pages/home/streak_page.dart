import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:speak_sphere/constants/asset_strings.dart';
import 'package:speak_sphere/constants/colors.dart';
import 'package:speak_sphere/constants/custom_lists.dart';
import 'package:speak_sphere/constants/edge_insets.dart';
import 'package:speak_sphere/presentation/widgets/custom_filled_button.dart';
import 'package:speak_sphere/presentation/widgets/fixed_bottom_layout.dart';

class StreakPage extends StatelessWidget {
  const StreakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset(Assets.voice_bg),
            const Gap(15),
            Text('2',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 128,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary)),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('days streak!',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: AppColors.black)),
              const Gap(10),
              Image.asset(Assets.fire)
            ]),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var day in days)
                        if (days.indexOf(day) < 2)
                          StreakTile(title: day, active: true)
                        else
                          StreakTile(title: day, active: false)
                    ],
                  ),
                  const Gap(25),
                  // const Gap(25),
                  Text(
                    'You’re on a roll, great job! Practice each day to keep up with your streak and earn XP points.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const Spacer(flex: 2),
            CustomFilledButton(
              title: 'Continue',
              onPressed: () => context.pop(),
            ),
            const Gap(30),
            Text(
              'Share',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 20, color: AppColors.primary),
            )
          ],
                    ),
        ),
      ),
    );
  }
}

class StreakTile extends StatelessWidget {
  const StreakTile({super.key, required this.title, required this.active});

  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: active ? AppColors.primary : AppColors.gray,
                fontSize: 20,
              ),
        ),
        const Gap(8),
        if (active)
          Image.asset(Assets.voice_sm_active)
        else
          Image.asset(Assets.voice_sm)
      ],
    );
  }
}
