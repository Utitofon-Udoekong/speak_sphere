import 'package:flutter/material.dart';
import 'package:speak_sphere/constants/custom_lists.dart';
import 'package:speak_sphere/constants/edge_insets.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:speak_sphere/constants/colors.dart';
import 'package:speak_sphere/constants/asset_strings.dart';
class Stat extends Lsphere{
  Stat({required super.image, required super.title, required super.percent});
  
}
var stats = [
  Stat(title: 'Books Read', percent: 308, image: Assets.books),
  Stat(title: 'Quiz Attempts', percent: 203, image: Assets.quiz),
  Stat(title: 'Audios Played', percent: 5000, image: Assets.listening),
  Stat(title: 'Articles Written', percent: 435, image: Assets.writing),
  Stat(title: 'Speech Recordings', percent: 150, image: Assets.speaking),
  Stat(title: 'Weekly Streak', percent: 490, image: Assets.fire),
];
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 20,
                      color: AppColors.black,
                    )),
                const Gap(30),
                Center(
                  child: Hero(
                    tag: 'profile-avatar',
                    child: CircleAvatar(
                      backgroundColor: const Color(0XFFFFBFB6),
                      radius: 50,
                      child: Image.asset(Assets.avatar),
                    )
                  ),
                ),
                const Gap(10),
                Center(
                  child: Text('Old Mark', style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w700),),
                ),
                const Gap(5),
                Center(
                  child: Text('oldmark@email.com', style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color:
                                          AppColors.gray,
                                      fontWeight: FontWeight.w400)),
                ),
                const Gap(10),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white
                    ),
                    child: Text('View personal details', style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color:
                                          AppColors.black,
                                      fontWeight: FontWeight.w600))
                  ),
                ),
                const Gap(20),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    childAspectRatio: 4 / 3.7
                  ),
                  itemCount: stats.length,
                  itemBuilder: (context, index){
                    final stat = stats[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(stat.image),
                          const Gap(8),
                          Text('${stat.percent}',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: AppColors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          const Gap(8),
                          Text(
                            stat.title,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: AppColors.gray, fontSize: 13),
                          ),
                        ],
                      ),
                    );
                  },
                )

              ],
            ),
          ),
        ),
      )
    );
  }
}
