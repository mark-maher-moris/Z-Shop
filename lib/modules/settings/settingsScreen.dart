import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('Settings Screen '),),
      body: Center(
child: Column(children: [
Text('Name',style: TextStyle(fontSize: 20),),
Text('Email',style: TextStyle(fontSize: 20),),

],),
      ),
    ));
  }
}
