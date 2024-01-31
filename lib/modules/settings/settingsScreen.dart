import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              // backgroundImage: AssetImage('assets/AccountPhoto.jpg'),
            ),
            Text(
              'Mark Maher',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'mkmkmkjnhb@gmail.com',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Text(
              '01210153804',
              style: TextStyle(fontSize: 20),
            ),
            Divider(),
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 150,
                width: 200,
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
