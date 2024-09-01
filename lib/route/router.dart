import 'package:cow_predict/route/route_constants.dart';
import 'package:cow_predict/screens/home/home_screen.dart';
import 'package:cow_predict/screens/predict/hasil/hasil_predict_screen.dart';
import 'package:cow_predict/screens/predict/predict_screen.dart';
import 'package:cow_predict/screens/tentang/tentang_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    case predictScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const PredictScreen(),
      );

    // case hasilPredictScreenRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const HasilPredictScreen(),
    //   );

    case tentangScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const TentangScreen(),
      );

    default:
      return MaterialPageRoute(
        // Make a screen for undefine
        builder: (context) => const HomeScreen(),
      );
  }
}
