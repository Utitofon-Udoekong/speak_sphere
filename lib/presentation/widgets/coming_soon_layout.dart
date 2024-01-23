import 'package:flutter/material.dart';
import 'package:speak_sphere/constants/asset_strings.dart';
import 'package:speak_sphere/constants/colors.dart';

class ComingSoonLayout extends StatelessWidget {
  const ComingSoonLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 80,),
        Image.asset(Assets.bro, width: width / 1.6,),
        const SizedBox(height: 20,),
        SizedBox(
          height: 90,
          child: IntrinsicHeight(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(Assets.active)),
              const SizedBox(width: 15,),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Coming Soon!',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColors.primary, fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 10,
                ),
                Text('We’ll be up soon, keep an eye on us.',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.gray, fontWeight: FontWeight.w400)),
              ]),
              Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(Assets.loading)),
            ]),
          ),
        )
      ],
    );
  }
}
