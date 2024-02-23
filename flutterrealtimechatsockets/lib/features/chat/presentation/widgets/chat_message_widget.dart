import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final String text;
  final String uid;
  final AnimationController animationController;
  const ChatMessageWidget(
      {super.key,
      required this.text,
      required this.uid,
      required this.animationController});

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: animationController,
        child: Container(
          child: uid == '123' ? myMessageChat() : notMyMessageChat(),
        ),
      );

  Widget myMessageChat() => Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 5, left: 50, right: 5),
          decoration: BoxDecoration(
            color: const Color(0xff4D9EF6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget notMyMessageChat() => Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 5, right: 50, left: 5),
          decoration: BoxDecoration(
            color: const Color(0xffE4E5E8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      );
}
