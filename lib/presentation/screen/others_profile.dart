import 'package:flutter/material.dart';
import 'package:message_app/common/colour_size_icon.dart';

class OthersProfile extends StatelessWidget {
  const OthersProfile({
    super.key,
    required this.username,
    required this.id,
    required this.url,
  });
  final String username;
  final String id;
  final String url;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        ),
        child: Container(
          color: kblackdarktrans,
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(url),
              ),
              Text(
                username,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const Text('UI designer'),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(kLocation), Text('Location')],
              ),
              Card(
                color: const Color.fromARGB(80, 255, 255, 255),
                child: SizedBox(
                  height: size.height / 8,
                  width: size.width / 2,
                  child: const Row(
                    children: [
                      medianumber(
                        number: '6',
                        name: 'voices',
                      ),
                      medianumber(
                        number: '13',
                        name: 'Media',
                      ),
                      medianumber(
                        number: '347',
                        name: 'Texts',
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}

class medianumber extends StatelessWidget {
  const medianumber({
    super.key,
    required this.number,
    required this.name,
  });
  final String number;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(number), Text(name)],
    );
  }
}
