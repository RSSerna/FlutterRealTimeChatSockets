import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

showCustomAlert(BuildContext buildContext, String title, String subtitle) {
  if (Platform.isAndroid) {
    return showDialog(
        context: buildContext,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(subtitle),
              actions: [
                MaterialButton(
                    elevation: 5,
                    textColor: Colors.amber,
                    onPressed: () => buildContext.pop(),
                    child: const Text('Local: Ok'))
              ],
            ));
  }
  return showCupertinoDialog(
      context: buildContext,
      builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () => buildContext.pop(),
                  child: const Text('Local: Ok')),
            ],
          ));
}
