import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/themes/themes.dart';
import '../products/productsSreen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Image.network(
          'https://img.freepik.com/free-photo/vivid-blurred-colorful-background_58702-2536.jpg?t=st=1706734534~exp=1706735134~hmac=6d827755d521d3031a297cc756753fbf5f736c5fe03f8c8c4cfbeae4be0fe9c4',
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            '\n Profile ',
            style: TextStyle(
                fontFamily: fontName, fontSize: 30, color: Colors.white),
          ),
        ),
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DottedBorder(
                  borderType: BorderType.Circle,
                  color: const Color.fromARGB(255, 187, 21, 9),
                  strokeWidth: 3,
                  dashPattern: [5, 5],
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile.jpg')),
                ),
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
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold),
      ),
      Text(
        '    ' + value,
        style: TextStyle(
            fontSize: 17, color: const Color.fromARGB(255, 122, 122, 122)),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 1,
          width: 150,
          color: Color.fromARGB(255, 65, 95, 119),
        ),
      ),
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
    path.lineTo(size.width, size.height * 0.3);
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
          color: Color.fromARGB(255, 245, 187, 187),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.red, width: 2)),
    ),
  );
}
