import 'package:flutter/material.dart';
import 'package:learnchatapp/CustomUI/custom_card.dart';
import 'package:learnchatapp/Models/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        icon:
            "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=2000",
        name: "Bomb",
        isGroup: false,
        time: "4:00",
        currentMessage: "Hello Bomb dev"),
    ChatModel(
        name: "Ming",
        isGroup: false,
        time: "5:00",
        currentMessage: "Hello Senior dev"),
    ChatModel(
        name: "Sun",
        isGroup: false,
        time: "7:00",
        currentMessage: "Hello Bomb dev G-able"),
    ChatModel(
        name: "Group1",
        isGroup: true,
        time: "7:00",
        currentMessage: "Hello Bomb dev G-able")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: chats[index],
        ),
      ),
    );
  }
}
