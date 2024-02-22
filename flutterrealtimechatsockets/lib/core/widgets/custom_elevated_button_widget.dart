import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        elevation: 2,
      ),
      onPressed: onPressed,
      child: SizedBox(
          width: double.infinity,
          height: 55,
          child: Center(
              child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ))),
    );
  }
}
