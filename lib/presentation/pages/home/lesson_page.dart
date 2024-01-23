import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_sphere/constants/asset_strings.dart';
import 'package:speak_sphere/constants/colors.dart';
import 'package:speak_sphere/constants/custom_lists.dart';
import 'package:speak_sphere/presentation/widgets/coming_soon_layout.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            toolbarHeight: 30,
            shadowColor: AppColors.background,
            surfaceTintColor: AppColors.background,
            foregroundColor: AppColors.background,
            pinned: true,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(30), child: LessonAppBar()),
          ),
          const SliverAppBar(
            shadowColor: AppColors.background,
            surfaceTintColor: AppColors.background,
            foregroundColor: AppColors.background,
            pinned: true,
            toolbarHeight: 30,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(43), child: LessonTabBar()),
          ),
          
          const SliverGap(20),
          SliverFillRemaining(
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(itemBuilder: (context, index){
                    final lesson = lessons[index];
                    return LessonCard(
                        image: lesson.image,
                        title: lesson.title,
                        description: lesson.description,
                        color: lesson.color);
                  }, itemCount: lessons.length,)
                ),
                const ComingSoonLayout()
              ]
            ),
          )
        ],
      ),
    );
  }
}

class LessonTabBar extends StatelessWidget {
  const LessonTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(25),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromRGBO(144, 138, 137, 0.50)),
                  borderRadius: BorderRadius.circular(30)),
              child: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.primary),
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                overlayColor:
                    const MaterialStatePropertyAll(AppColors.background),
                labelColor: AppColors.white,
                unselectedLabelColor: AppColors.gray,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(
                    text: 'Audio Lesson',
                  ),
                  Tab(
                    text: 'Video Lesson',
                  ),
                ],
              ),
            ),
          ),
          const Gap(25),
        ],
      ),
    );
  }
}

class LessonAppBar extends StatelessWidget {
  const LessonAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(45),
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.gray.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
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
        const Gap(45),
      ],
    );
  }
}

class LessonCard extends StatelessWidget {
  const LessonCard(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.color});

  final String image;
  final String title;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        margin: const EdgeInsets.only(bottom: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(Colors.black38, BlendMode.darken))),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
            ),
            const Gap(10),
            Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppColors.white, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
          Positioned(
              bottom: 30,
              right: 10,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                width: 45,
                height: 45,
                alignment: Alignment.center,
                child: Image.asset(Assets.play),
              ))
      ]
    );
  }
}
