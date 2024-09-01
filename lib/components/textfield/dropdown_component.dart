import 'package:cow_predict/values/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownComponent extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? value;
  final Function(String items) onSelectedItems;
  final double radius;

  const DropdownComponent(
      {Key? key,
      required this.items,
      required this.onSelectedItems,
      this.value,
      this.hintText = "",
      this.radius = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        focusColor: Colors.white,
        filled: true,
        fillColor: secondaryColor,
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
        contentPadding: EdgeInsets.only(left: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      hint: Text(
        hintText,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      value: value,
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ))
          .toList(),
      onChanged: (value) {
        onSelectedItems(value.toString());
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
