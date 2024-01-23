import 'package:flutter/material.dart';
import 'package:speak_sphere/constants/asset_strings.dart';

const interests = [
'Studies',
'Reading',
'Technologies' ,
'Travel',
'Psychology',
'Gaming',
'TV/Movies',
'Sports',
'Languages',
'Fashion',
'Fitness',
'Pets',
'Food',
'Climate Change',
'Self-care',
'Work life',
'Culture',
'Design',
'Sociology',
'Music',
'Outdoor',
'Networking',
'Romance',
'Shopping',
'Sight-seeing',
];

var days = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
];


var spheres = <Lsphere>[
  Lsphere(image: Assets.reading, title: 'Reading', percent: 50),
  Lsphere(image: Assets.listening, title: 'Listening', percent: 50),
  Lsphere(image: Assets.writing, title: 'Writing', percent: 70),
  Lsphere(image: Assets.speaking, title: 'Speaking', percent: 25),
  Lsphere(image: Assets.books, title: 'Books', percent: 80),
  Lsphere(image: Assets.quiz, title: 'Quizzes', percent: 40),
];

var lessons = [
  Lesson(title: 'First Trip', description: 'Here you will listen to conversations between tourists, and learn to speak together with them!', image: Assets.lesson_1, color: Color(0xFFE16723)),
  Lesson(title: 'Freelance Work', description: 'After taking this classes, you will be able to take orders from foreigners! ', image: Assets.lesson_2, color: Color(0xFF908A89)),
  Lesson(title: 'First Meeting', description: 'You will learn to communicate with your colleagues and understand them!', image: Assets.lesson_3, color: Color(0xFFCB9937)),
  Lesson(title: 'Meeting With Partners ', description: 'You will learn to communicate with your colleagues and understand them!', image: Assets.lesson_4, color: Color(0xFF000000)),
];

class Lsphere {
  final String image;
  final String title;
  final int percent;
  Lsphere({
    required this.image,
    required this.title,
    required this.percent,
  });
}
class Lesson {
  final String title;
  final String description;
  final String image;
  final Color color;
  Lesson({
    required this.title,
    required this.description,
    required this.image,
    required this.color,
  });
}
