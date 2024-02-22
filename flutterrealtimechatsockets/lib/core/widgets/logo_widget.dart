import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String text;
  const LogoWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: 200,
        child:  Column(children: [
          const Image(image: AssetImage('assets/tag-logo.png')),
          Text(
            text,
            style: const TextStyle(fontSize: 25),
          )
        ]),
      ),
    );
  }
}