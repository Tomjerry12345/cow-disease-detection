import 'package:cow_predict/components/header/header_component.dart';
import 'package:cow_predict/components/text/text_component.dart';
import 'package:cow_predict/values/position_utils.dart';
import 'package:flutter/material.dart';

class HasilPredictScreen extends StatelessWidget {
  const HasilPredictScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(
        title: "Hasil predict",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  TextComponent(
                    "Usia : ",
                    size: 18,
                  ),
                  H(16),
                  TextComponent("15", size: 18)
                ],
              ),
              V(16),
            ],
          ),
        ),
      ),
    );
  }
}
