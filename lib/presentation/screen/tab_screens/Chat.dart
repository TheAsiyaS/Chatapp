import 'package:flutter/material.dart';
import 'package:message_app/common/colour_size_icon.dart';

final images = [
  'https://t4.ftcdn.net/jpg/06/74/49/09/360_F_674490958_Ak7DhLW2Xjb7fuxALHl78tzFKN4a56p0.jpg',
  'https://t4.ftcdn.net/jpg/05/91/13/33/360_F_591133304_lZHXmp1PoEh8Ceo9U2HoMYMUmExJ9sal.jpg',
  'https://cdn.pixabay.com/photo/2023/12/19/22/46/business-8458541_1280.jpg',
  'https://img.freepik.com/free-photo/modern-stylish-muslim-woman-hijab-business-style-jacket-black-abaya-walking-city-street-with-laptop_285396-9497.jpg',
  'https://media.istockphoto.com/id/1568051602/photo/smiling-businesswoman-posing-in-modern-office.webp?b=1&s=612x612&w=0&k=20&c=vdIO15qTJ9jPEn_prss1Mur3TlHy70uOOFXpwnqjEaI=',
  'https://media.istockphoto.com/id/1387956632/photo/positive-muslim-black-lady-working-on-laptop-at-office.jpg?s=612x612&w=0&k=20&c=Zy8ism5I9mNtIIWz2cHlhybMP1m1OcIDq2iaSyH62dc=',
  'https://i.pinimg.com/originals/ee/d3/03/eed303679e96d27a96cd4850f4e3fb4c.jpg',
  'https://img.freepik.com/free-photo/happy-male-entrepreneur-working-computer-office_637285-6738.jpg',
  'https://media.istockphoto.com/id/1413766112/photo/successful-mature-businessman-looking-at-camera-with-confidence.jpg?s=612x612&w=0&k=20&c=NJSugBzNuZqb7DJ8ZgLfYKb3qPr2EJMvKZ21Sj5Sfq4=',
  'https://imageio.forbes.com/specials-images/imageserve/60bfd4cc39671e95929b0781/Handsome-businessman-sitting-in-modern-office-/960x0.jpg?height=473&width=711&fit=bounds',
  'https://static.vecteezy.com/system/resources/thumbnails/029/269/208/small/confident-african-american-businesswoman-in-expensive-work-attire-ai-generative-photo.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm5V3d4ispi7a1A98uByvqDJ_mr9StVTa4hg&s'
];

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    images.shuffle();
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                return Container(
                    height: size.height / 8,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 87, 94, 93),
                          Color.fromARGB(128, 77, 80, 81),
                          kblack
                        ]),
                        color: const Color.fromARGB(128, 68, 69, 69),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(images[index]),
                        ),
                        title: const Text(
                          'Username',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${index + 1}+ new messages, check now!',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Column(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: const LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      colors: [
                                        Color.fromARGB(255, 0, 115, 150),
                                        kblack,
                                        Color.fromARGB(255, 0, 92, 150)
                                      ])),
                              child: Center(
                                  child: Text(
                                '${index + 1}',
                                style: const TextStyle(fontSize: 15),
                              )),
                            ),
                            Text('$index:00')
                          ],
                        ),
                      ),
                    ));
              },
              separatorBuilder: (context, index) {
                return h10;
              },
              itemCount: images.length),
        )
      ],
    );
  }
}
/*

 */
