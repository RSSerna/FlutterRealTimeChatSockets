import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/features/chat/presentation/widgets/send_button_widget.dart';

class BottomInputField extends StatefulWidget {
  const BottomInputField({
    super.key,
  });

  @override
  State<BottomInputField> createState() => _BottomInputFieldState();
}

class _BottomInputFieldState extends State<BottomInputField> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textEditingController,
              onSubmitted: _handleSubmit,
              onChanged: (_) {
                setState(() {});
              },
              decoration: const InputDecoration.collapsed(
                  hintText: 'Local: Enviar mensaje'),
              focusNode: _focusNode,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: SendButton(
              textEditingController: _textEditingController,
              onPressed: _handleSubmit,
            ),
          )
        ],
      ),
    ));
  }

  void _handleSubmit(String text) {
    print(text);
    _focusNode.requestFocus();
    _textEditingController.clear();
    setState(() {});
  }
}
