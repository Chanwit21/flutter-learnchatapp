import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnchatapp/Models/chat_model.dart';
import 'package:learnchatapp/Screens/individual_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualPage(
              chatModel: chatModel,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: chatModel.icon != null
                ? CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(chatModel.icon.toString()),
                    backgroundColor: Colors.transparent,
                  )
                : CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blueGrey,
                    child: SvgPicture.asset(
                      chatModel.isGroup
                          ? "assets/groups.svg"
                          : "assets/person.svg",
                      color: Colors.white,
                      height: 37,
                      width: 37,
                    ),
                  ),
            title: Text(
              chatModel.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.done_all,
                ),
                Text(
                  chatModel.currentMessage,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                )
              ],
            ),
            trailing: Text(
              chatModel.time,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              right: 20,
              left: 80,
            ),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
