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
        Image.network(
            'https://img.freepik.com/free-photo/vivid-blurred-colorful-background_58702-2536.jpg?t=st=1706734534~exp=1706735134~hmac=6d827755d521d3031a297cc756753fbf5f736c5fe03f8c8c4cfbeae4be0fe9c4'),
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: Colors.white,
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
                Row(
                  children: [
                    profileBtn(title: 'Delete Account'),
                    profileBtn(title: 'Sign Out'),
                  ],
                ),
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

Widget profileBtn({required String title}) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Center(child: Text(title)),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 154, 154),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.red, width: 2)),
    ),
  );
}
