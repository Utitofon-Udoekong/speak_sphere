import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_sphere/constants/asset_strings.dart';
import 'package:speak_sphere/constants/colors.dart';
import 'package:speak_sphere/constants/custom_lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int grid = 2;
  
  toggleGrid() {
    if(grid > 1){
      setState(() {
        grid = 1;
      });
    }else{
      setState((){
        grid = 2;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
          SliverAppBar(
            toolbarHeight: 30,
            shadowColor: AppColors.background,
            surfaceTintColor: AppColors.background,
            foregroundColor: AppColors.background,
            pinned: true,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(150),
                child: Column(
                  children: [
                    const HomeAppBar(),
                    const Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Your\nLearning Sphere',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    color:
                                        const Color.fromARGB(255, 223, 140, 129),
                                    fontWeight: FontWeight.w700),
                          ),
                          GestureDetector(
                            onTap: () => toggleGrid(),
                            child: Image.asset(Assets.grid)),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        const SliverGap(15),
        SliverPadding(
          padding: const EdgeInsets.all(15),
          sliver: SliverGrid.count(
            crossAxisCount: grid,
            mainAxisSpacing: 25,
            crossAxisSpacing: 20,
            childAspectRatio: grid > 1 ? 4 / 3.8 : 16 / 7,
            children: [
              for (var sphere in spheres)
                if (sphere.title == 'Speaking')
                  GridCard(
                    icon: sphere.image,
                    title: sphere.title,
                    percent: sphere.percent,
                    onTap: () => context.push('/speaking-page'),
                  )
                else
                  GridCard(
                      icon: sphere.image,
                      title: sphere.title,
                      percent: sphere.percent)
            ],
          ),
        )
      ],
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(15),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.gray.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(Assets.language),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => context.push("/streak-page"),
                    child: Row(
                      children: [
                        Image.asset(Assets.fire),
                        const Gap(3),
                        Text(
                          '2',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: AppColors.primary),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Image.asset(Assets.streak),
                      const Gap(3),
                      Text(
                        '17',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: AppColors.primary),
                      )
                    ],
                  ),
                  const Spacer(flex: 2),
                  Image.asset(Assets.notification),
                ],
              ),
            ),
          ),
          const Gap(15),
          GestureDetector(
            onTap: () => context.push('/profile'),
            child: Hero(
              tag: 'profile-avatar',
              child: CircleAvatar(
                backgroundColor: const Color(0XFFFFBFB6),
                radius: 18,
                child: Image.asset(Assets.avatar),
              )
            ),
          ),
          const Gap(15),
        ],
      ),
    );
  }
}


class GridCard extends StatelessWidget {
  const GridCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.percent,
      this.onTap});
  final String icon;
  final String title;
  final int percent;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(icon),
              const Gap(8),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColors.black, fontSize: 20),
              ),
              const Gap(2),
              Text('You completed $percent%',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.gray,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)),
              const Gap(5),
              LinearProgressIndicator(
                  minHeight: 10,
                  backgroundColor: AppColors.gray,
                  color: AppColors.primary,
                  value: percent / 100,
                  borderRadius: BorderRadius.circular(20)),
            ],
          )),
    );
  }
}
