import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/features/chat/presentation/widgets/bottom_input_field_widget.dart';
import 'package:flutterrealtimechatsockets/features/chat/presentation/widgets/chat_message_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  final List<ChatMessageWidget> _messages = const [
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Column(
          children: [
            CircleAvatar(
              maxRadius: 14,
              child: Text(
                'Te',
                style: TextStyle(fontSize: 10),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Fernando Herrera',
              style: TextStyle(color: Colors.black, fontSize: 15),
            )
          ],
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
              ),
            ),
            const Divider(
              height: 1,
            ),
            Container(
              color: Colors.white,
              child: const BottomInputField(),
            )
          ],
        ),
      ),
    );
  }
}
