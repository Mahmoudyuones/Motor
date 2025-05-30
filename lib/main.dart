import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/features/screens/home_screen.dart';
import 'package:motor/features/screens/payment_screen.dart';
import 'package:motor/features/screens/product_details_screen.dart';
import 'package:motor/features/screens/register_screen.dart';
import 'package:motor/features/screens/search_and_filter_results_screen.dart';
import 'package:motor/features/screens/search_screen.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(403, 893),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (_, __) => MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              RegisterScreen.routeName: (_) => RegisterScreen(),
              HomeScreen.routeName: (_) => HomeScreen(),
              SearchScreen.routeName: (_) => SearchScreen(),
              SearchAndFilterResultsScreen.routeName:
                  (_) => SearchAndFilterResultsScreen(),
              ProductDetailsScreen.routeName: (_) => ProductDetailsScreen(),
              PaymentScreen.routeName: (_) => PaymentScreen(),
            },
            initialRoute: HomeScreen.routeName,
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },
          ),
    );
  }
}
