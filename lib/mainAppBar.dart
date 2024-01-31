import 'package:flutter/material.dart';

import 'core/consts.dart';
import 'modules/search/searchScreen.dart';

PreferredSizeWidget mainAppBar({required BuildContext context}) {
  return AppBar(
      backgroundColor: Colors.white,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            icon: Icon(Icons.search))
      ],
      title: Container(
          height: 60,
          width: 100,
          child: Image.asset(
            logoPath,
            fit: BoxFit.contain,
          )));
}
