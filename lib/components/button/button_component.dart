import 'package:cow_predict/components/text/text_component.dart';
import 'package:cow_predict/values/constants.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final Function()? onPressed;

  const ButtonComponent(this.text,
      {Key? key, this.color, this.size = 12, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: color ?? secondaryColor),
        onPressed: onPressed,
        child: TextComponent(
          text,
          color: Colors.white,
          size: size,
        ));
  }
}
