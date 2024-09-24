import 'package:flutter/material.dart';
import 'package:message_app/common/colour_size_icon.dart';
import 'package:message_app/presentation/screen/CommonWidget.dart';
import 'package:message_app/presentation/animation/LogoAnimation.dart';
import 'package:message_app/presentation/screen/profile_page.dart';

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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://images.lifestyleasia.com/wp-content/uploads/sites/7/2024/02/15114642/Best-kdramas-with-female-CEO-2.jpg'),
                    ),
                  ),
                  w10
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
              child: TabBarView(children: [
                CommonWidget(
                  iscall: false,
                ),
                CommonWidget(
                  iscall: true,
                ),
                CommonWidget(
                  iscall: false,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
