import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnchatapp/Models/chat_model.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back,
                size: 24,
              ),
              widget.chatModel.icon != null
                  ? CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          NetworkImage(widget.chatModel.icon.toString()),
                      backgroundColor: Colors.transparent,
                    )
                  : CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blueGrey,
                      child: SvgPicture.asset(
                        widget.chatModel.isGroup
                            ? "assets/groups.svg"
                            : "assets/person.svg",
                        color: Colors.white,
                        height: 27,
                        width: 27,
                      ),
                    ),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: const TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "last seen today at ${widget.chatModel.time}",
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(
                value: "View Contact",
                child: Text("View Contact"),
              ),
              PopupMenuItem(
                value: "Media, links, and docs",
                child: Text("Media, links, and docs"),
              ),
              PopupMenuItem(
                value: "Whatsapp web",
                child: Text("Whatsapp web"),
              ),
              PopupMenuItem(
                value: "Search",
                child: Text("Search"),
              ),
              PopupMenuItem(
                value: "Mute Notification",
                child: Text("Mute Notification"),
              ),
              PopupMenuItem(
                value: "Wallpaper",
                child: Text("Wallpaper"),
              ),
            ];
          })
        ],
      ),
    );
  }
}
