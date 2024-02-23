import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final void Function(String text) onPressed;
  final TextEditingController textEditingController;
  const SendButton({
    super.key,
    required this.onPressed,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: textEditingController.text.isEmpty
                ? null
                : () => onPressed(textEditingController.text),
            child: const Text('Local: Enviar'),
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: IconTheme(
              data: const IconThemeData(color: Colors.amber),
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: textEditingController.text.isEmpty
                    ? null
                    : () => onPressed(textEditingController.text),
                icon: const Icon(
                  Icons.send,
                ),
              ),
            ),
          );
  }
}
