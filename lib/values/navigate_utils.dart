import 'package:flutter/material.dart';
import 'package:get/get.dart';

navigatePush(context, page, {isRemove = false}) {
  if (isRemove) {
    return Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (Route route) => false);
  } else {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

navigatePop(context, {data}) {
  Navigator.pop(context, data);
}

navigatePushNamed(String page, {dynamic arg}) {
  Navigator.pushNamed(Get.context!, page, arguments: arg);
}
