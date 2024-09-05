import 'package:cow_predict/components/header/header_component.dart';
import 'package:cow_predict/components/button/button_component.dart';
import 'package:cow_predict/components/text/text_component.dart';
import 'package:cow_predict/route/route_constants.dart';
import 'package:cow_predict/values/assets_utils.dart';
import 'package:cow_predict/values/navigate_utils.dart';
import 'package:cow_predict/values/position_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderComponent(),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // V(24),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(Assets.logo),
                  color: Color.fromARGB(255, 240, 240, 240),
                ),
                H(24),
                TextComponent("Cow\nPredict")
              ],
            ),
            V(24),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(
                color: Colors.grey,
                thickness: 2,
                indent: 40, // Mengatur indentasi dari kiri
                endIndent: 40, // Mengatur indentasi dari kanan
              ),
            ),
            V(24),
            const Spacer(),
            Container(
              width: 300,
              child: ButtonComponent("Predict", onPressed: () {
                navigatePushNamed(predictScreenRoute);
              }),
            ),
            V(24),
            Container(
              width: 300,
              child: ButtonComponent("Tentang", onPressed: () {
                navigatePushNamed(tentangScreenRoute);
              }),
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
