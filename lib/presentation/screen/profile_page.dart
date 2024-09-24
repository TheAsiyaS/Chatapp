import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_app/common/colour_size_icon.dart';
import 'package:message_app/presentation/animation/ImageFlipAnimation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.lifestyleasia.com/wp-content/uploads/sites/7/2024/02/15114642/Best-kdramas-with-female-CEO-2.jpg'))),
        child: Container(
          height: size.height,
          width: size.width,
          color: kblackdarktrans,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ImageFlip(
                    url:
                        'https://images.lifestyleasia.com/wp-content/uploads/sites/7/2024/02/15114642/Best-kdramas-with-female-CEO-2.jpg',
                    radius: 70,
                    isasset: false),
                    h40,
                CustomCupertino(
                    size: size,
                    placeholdertext: 'Username',
                    controller: controller),
                h10,
                CustomCupertino(
                    size: size,
                    placeholdertext: 'Name',
                    controller: controller),
                h10,
                CustomCupertino(
                    size: size,
                    placeholdertext: 'Password',
                    controller: controller),
                h10,
                CustomCupertino(
                    size: size,
                    placeholdertext: 'Location',
                    controller: controller),
                const Spacer(),
                Container(
                  color: const Color.fromARGB(154, 87, 116, 135),
                  child: SizedBox(
                    height: size.height / 3,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'INFORMATION THAT ONLY YOU CAN SEE ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Divider(
                            color: klightwhite,
                          ),
                          const Text(
                            'The below datas are private , nobady can see and you can\'t change it. Below data\'s are permanent',
                            style: TextStyle(color: kgrey),
                          ),
                          h10,
                          SizedBox(
                            height: 70,
                            width: size.width / 1.2,
                            child: const Wrap(
                              spacing:
                                  20, // Adjust the spacing between the items
                              alignment: WrapAlignment.spaceAround,
                              children: [
                                Text('• abcd124@gmail.com'),
                                Text('• 1234567890'),
                                Text('• JAN - 02 - 2024'),
                              ],
                            ),
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundColor: Color.fromARGB(52, 10, 32, 43),
                              radius: 20,
                              backgroundImage:
                                  AssetImage('asset/LogobeRemv.png'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCupertino extends StatelessWidget {
  const CustomCupertino({
    super.key,
    required this.size,
    required this.placeholdertext,
    required this.controller,
  });

  final Size size;
  final String placeholdertext;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: size.width / 1.4,
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholdertext,
        placeholderStyle: const TextStyle(color: kwhite),
        style: const TextStyle(color: kwhite),
        decoration: BoxDecoration(
            color: const Color.fromARGB(134, 24, 56, 83),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
