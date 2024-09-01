import 'package:cow_predict/components/text/text_component.dart';
import 'package:cow_predict/values/constants.dart';
import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const HeaderComponent({this.title = "Nama aplikasi", super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: false,
      title: TextComponent(
        title,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: white, // Ubah warna tombol "back" di sini
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
