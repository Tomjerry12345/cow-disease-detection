import 'package:cow_predict/route/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cow_predict/route/router.dart' as router;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: homeScreenRoute,
    );
  }
}
