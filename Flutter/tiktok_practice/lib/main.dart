import 'package:flutter/material.dart';
import 'package:tiktok_practice/constants/gaps.dart';
import 'package:tiktok_practice/constants/sizes.dart';
import 'package:tiktok_practice/screens/sign_up/sign_up_sceen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TikTok Practice',
        theme: ThemeData(
          primaryColor: const Color(0xFFE9435A),
        ),
        home: const SignUpScreen());
  }
}
