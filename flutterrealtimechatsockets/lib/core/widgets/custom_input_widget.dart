import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController textEditingController;

  const CustomInput({
    super.key,
    required this.hintText,
    required this.iconData,
    required this.textEditingController,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 50),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 5),
                blurRadius: 5,
              )
            ]),
        child: TextField(
          controller: textEditingController,
          autocorrect: false,
          keyboardType: textInputType,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(iconData),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: hintText,
          ),
        ));
  }
}
