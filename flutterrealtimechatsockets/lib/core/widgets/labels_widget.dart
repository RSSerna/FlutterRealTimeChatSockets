import 'package:flutter/material.dart';

class LabelsWidget extends StatelessWidget {
  final String subtitle;
  final String title;
  final Function()? onTap;

  const LabelsWidget(
      {super.key, required this.subtitle, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          subtitle,
          style: const TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
