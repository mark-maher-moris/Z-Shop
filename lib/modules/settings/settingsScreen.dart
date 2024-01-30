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
          ],
        ),
      ),
    ));
  }
}
