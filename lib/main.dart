import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/features/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(172, 377),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (_, __) => MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {LoginScreen.routeName: (_) => LoginScreen()},
            initialRoute: LoginScreen.routeName,
          ),
    );
  }
}
