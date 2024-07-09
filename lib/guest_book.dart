import 'package:flutter/material.dart';
import 'guest_book_message.dart';

class GuestBook extends StatelessWidget {
  const GuestBook({
    super.key,
    required this.addMessage,
    required this.messages,
  });

  final Future<void> Function(String message) addMessage;
  final List<GuestBookMessage> messages;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var message in messages)
          Text('${message.name}: ${message.message}'),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Leave a message',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () async {
                  await addMessage(controller.text);
                  controller.clear();
                },
                child: const Text('SEND'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
