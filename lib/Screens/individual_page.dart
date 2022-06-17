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
      backgroundColor: Colors.blueGrey,
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            // LastView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Card(
                      margin:
                          const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Typing Text",
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.emoji_emotions),
                            onPressed: () {},
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.attach_file),
                                onPressed: () {},
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.camera_alt)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                      right: 2,
                      left: 2,
                    ),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFF128C7E),
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.mic),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
