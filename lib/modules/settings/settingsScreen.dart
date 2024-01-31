import 'package:flutter/material.dart';

import '../../core/themes/themes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: mainColor,
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.jpg')),
                SizedBox(
                  height: 40,
                ),
                profileBox(title: 'Name', value: 'Mark Maher'),
                profileBox(title: 'Email', value: 'markmaher933@gmail.com'),
                profileBox(title: 'Phone', value: '01210153804'),
                profileBox(title: 'Points', value: '233'),
                profileBox(title: 'Credits', value: '2'),
              ],
            ),
          ),
        ),
      ],
    )));
  }
}

Widget profileBox({required String title, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title + ':',
        style: TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 85, 85, 85),
            fontWeight: FontWeight.bold),
      ),
      Text(
        '  ' + value,
        style: TextStyle(fontSize: 17),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.1);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.4);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
