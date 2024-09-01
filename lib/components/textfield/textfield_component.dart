import 'package:cow_predict/values/constants.dart';
import 'package:flutter/material.dart';

class TextfieldComponent extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Color color;
  final TextInputType inputType;
  final String label;
  final bool enabled;
  final double? size;
  final int? maxLines;
  final TextAlignVertical? textAlignVertical;
  final Widget? prefixIcon;
  final double radius;

  const TextfieldComponent(
      {this.hintText = "",
      this.onChanged,
      this.controller,
      this.color = Colors.white70,
      this.inputType = TextInputType.text,
      this.label = "",
      this.enabled = true,
      this.size,
      this.maxLines,
      this.textAlignVertical,
      this.prefixIcon,
      this.radius = 15});

  @override
  Widget build(BuildContext context) {
    return TextField(
        enabled: enabled,
        style: TextStyle(fontSize: size, color: Colors.white),
        textAlignVertical: textAlignVertical,
        keyboardType: inputType,
        controller: controller,
        onChanged: onChanged,
        // cursorColor: Colors.black,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          // label: Text(label),
          prefixIcon: prefixIcon,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: secondaryColor,
          labelStyle: TextStyle(fontSize: 12),
          contentPadding: EdgeInsets.only(left: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(radius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 107, 107, 107)),
            borderRadius: BorderRadius.circular(radius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(radius),
          ),
        ));
  }
}
