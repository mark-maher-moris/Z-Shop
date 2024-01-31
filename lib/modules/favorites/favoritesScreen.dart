import 'package:flutter/material.dart';

import '../../mainAppBar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    
      child: Scaffold(appBar:  mainAppBar(context: context), body: Center()));
  }
}
