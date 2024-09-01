import 'package:flutter/material.dart';

Future<void> dialogShow(
    {required BuildContext context,
    String? title,
    Widget? content,
    List<Widget>? actions}) async {
  await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title != null ? Text(title) : null,
          content: SingleChildScrollView(
            child: content,
          ),
          actions: actions,
        );
      });
}

void dialogClose(context) {
  Navigator.of(context).pop();
}
