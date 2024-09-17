import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:message_app/common/colour_size_icon.dart';

class ChatDetailed extends StatelessWidget {
  const ChatDetailed(
      {super.key, required this.profileUrl, required this.username});
  final String profileUrl;
  final String username;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(profileUrl),
            ),
            w20,
            Text(username)
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(kmoreVertical))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height / 1.35,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: size.width / 2,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.bottomLeft,
                                colors: [
                                  Color.fromARGB(255, 14, 130, 197),
                                  Color.fromARGB(255, 3, 105, 160),
                                  Color.fromARGB(255, 4, 52, 81)
                                ]),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(' Hello 🖐️🖐️, how are you ?')),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return h20;
                },
                itemCount: 20),
          ),
          Card(
            color: const Color.fromARGB(65, 10, 52, 104),
            shadowColor: kblue,
            child: SizedBox(
              height: size.height / 12,
              width: size.width,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.circle_grid_hex)),
                  SizedBox(
                    height: 50,
                    width: size.width / 1.4,
                    child: CupertinoTextField(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(35, 255, 255, 255)),
                      placeholder: 'Type here....',
                      placeholderStyle: const TextStyle(color: kgrey),
                    style: const TextStyle(color: kwhite),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.mic_circle_fill,
                        size: 40,
                        color: Color.fromARGB(156, 255, 255, 255),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
