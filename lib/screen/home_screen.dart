import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/common/colour_size_icon.dart';
import 'package:message_app/screen/tab_screens/Archievd.dart';
import 'package:message_app/screen/tab_screens/Calls.dart';
import 'package:message_app/screen/tab_screens/Chat.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('asset/Logo.png'),
          ),
          title: Text(
            'THE WINGS',
            style: GoogleFonts.lora(),
          ),
          actions: [IconButton(onPressed: () {}, icon: const Icon(ksetting))],
        ),
        body: const Column(
          children: [
            TabBar(
              labelColor: kwhite,
              unselectedLabelColor: kwhite,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              indicatorColor: Color.fromARGB(255, 8, 93, 112),
              tabAlignment: TabAlignment.fill,
              tabs: [
                Tab(
                  child: Text(
                    'Chats',
                  ),
                ),
                Tab(
                  child: Text(
                    'Calls',
                  ),
                ),
                Tab(
                  child: Text(
                    'Archievd',
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                  children: [ChatScreen(), CallsScreen(), ArchievdScreen()]),
            )
          ],
        ),
      ),
    );
  }
}
