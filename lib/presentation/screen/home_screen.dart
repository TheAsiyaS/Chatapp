import 'package:flutter/material.dart';
import 'package:message_app/common/colour_size_icon.dart';
import 'package:message_app/presentation/screen/CommonWidget.dart';
import 'package:message_app/presentation/animation/LogoAnimation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const SizedBox(
                    height: 100,
                    child: AnimationLogo(),
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(kmenu))
                ],
              ),
            ),
            const TabBar(
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
            const Expanded(
              child: TabBarView(
                  children: [CommonWidget(), CommonWidget(), CommonWidget()]),
            )
          ],
        ),
      ),
    );
  }
}
