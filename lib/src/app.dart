import 'package:flutter/material.dart';
import 'views/login.dart';
import 'views/otp.dart';
import 'views/data_diri.dart';
import 'views/follow_akun_amil.dart';
import '../main.dart';

void App() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MyApp(),
        '/login': (context) => Login(),
        '/login/otp': (context) => Otp(),
        '/login/data-diri': (context) => DataDiri(),
        '/login/follow-akun': (context) => FollowAkun(),
//        '/onboarding': (context) => OnboardingView(),
//        '/onboarding/step2': (context) => Step2View(),
//        '/onboarding/step3': (context) => Step3View(),
//        '/onboarding/step4': (context) => Step4View(),
//        '/onboarding/success': (context) => SuccessRegisterView(avatarImage: null),
//        '/user/story': (context) => UserStoryView(),
//        '/chats': (context) => ChatScreen(),
      },
    ),
  );
}