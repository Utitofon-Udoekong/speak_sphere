import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:speak_sphere/constants/colors.dart';
import 'package:speak_sphere/constants/custom_lists.dart';
import 'package:speak_sphere/constants/edge_insets.dart';
import 'package:speak_sphere/presentation/widgets/custom_filled_button.dart';
import 'package:speak_sphere/presentation/widgets/fixed_bottom_layout.dart';
import 'package:speak_sphere/presentation/widgets/linear_progress_bar.dart';
// import 'package:path_drawing/path_drawing.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var selectedInterests = <String>[
    // 'Reading', 'Psychology','Gaming','Design','Music'
  ];

  bool isSelected(String value) => selectedInterests.contains(value);
  double getProgress() {
    if (selectedInterests.length >= 6) {
      return 1.0;
    } else {
      return selectedInterests.length / 6;
    }
  }

  int getCount() =>
      selectedInterests.length >= 6 ? 6 : selectedInterests.length;
  selectInterest(String value) {
    setState(() {
      selectedInterests.add(value);
    });
  }

  removeInterest(String value) {
    setState(() {
      selectedInterests.remove(value);
    });
  }

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
                    onTap: () => context.go('/'),
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: selectedInterests.length / 6),
                      duration: 0.3.seconds,
                      builder: (context, value, child) {
                        return LinearProgressBar(
                          value: getProgress(),
                        );
                      }
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${getCount()}/6',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text('What interests you?',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black)),
              const SizedBox(height: 10),
              Text('Select all that applies',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.gray)),
              const SizedBox(height: 20),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  for (var interest in interests)
                    AppChoice(
                      title: interest,
                      selected: isSelected(interest),
                      selectInterest: () => selectInterest(interest),
                      removeInterest: () => removeInterest(interest)
                    ),
                ],
              ),
              const SizedBox(height: 15),
              const AppChoice(title: 'Add others +', selected: true),
              const Spacer(),
              CustomFilledButton(
                  title: 'Continue', onPressed: () => context.go('/home')),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  'Skip for now',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 20, color: AppColors.primary),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}

class AppChoice extends StatelessWidget {
  const AppChoice({
    super.key,
    required this.title,
    required this.selected,
    this.selectInterest,
    this.removeInterest,
  });

  final String title;
  final bool selected;
  final Function()? selectInterest;
  final Function()? removeInterest;

  @override
  Widget build(BuildContext context) {
    return selected
        ? InkWell(
            onTap: removeInterest,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.primary_light,
                  border:
                      Border.all(color: AppColors.primary.withOpacity(0.7))),
              padding:
                  const EdgeInsets.symmetric(horizontal: 11.0, vertical: 7.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.white,
                    ),
              ),
            ),
          )
        : DottedBorder(
            padding: const EdgeInsets.all(1),
            borderType: BorderType.RRect,
            radius: const Radius.circular(30),
            color: AppColors.primary_light, //color of dotted/dash line
            strokeWidth: 1, //thickness of dash/dots
            dashPattern: const [10, 6],
            child: InkWell(
              onTap: selectInterest,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11.0, vertical: 7.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.black,
                      ),
                ),
              ),
            ));
  }
}
// ChoiceChip(
//         padding: const EdgeInsets.all(1.0),
//         showCheckmark: false,
//         onSelected: onSelected,
        // label: Text(
        //   title,
        //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
        //         color: selected ? AppColors.white : AppColors.black,
        //       ),
        // ),
//         selected: selected,
//         selectedColor: AppColors.primary_light,
//         side: BorderSide.none,
//       )
// class DottedBorderPainter extends CustomPainter {
//   final Color color;
//   final double strokeWidth;

//   DottedBorderPainter({this.color = AppColors.primary_light, this.strokeWidth = 1});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..strokeWidth = 0.5;

//     final path = Path();
//     path.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(30)));
//     path.addPath(dashPath(path, dashArray: CircularIntervalList<double>(
//             [3.0,2.0],
//           )), Offset.zero);
//     path.close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }


