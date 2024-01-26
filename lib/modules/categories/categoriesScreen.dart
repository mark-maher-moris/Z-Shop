import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Row(
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
              child: Column(
            children: [
              _buildSideCategoryBox(),
              _buildSideCategoryBox(),
              _buildSideCategoryBox(),
              _buildSideCategoryBox(),
              _buildSideCategoryBox(),
              _buildSideCategoryBox(),
            ],
          )),
        ),
        VerticalDivider(),
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
              child: Column(
            children: [],
          )),
        ),
      ],
    )));
  }
}

Widget _buildSideCategoryBox() {
  return InkWell(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.all(5),
      //width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              "https://rukminim2.flixcart.com/image/832/832/xif0q/bag/g/r/j/large-size-high-quality-stylish-backpack-casual-school-bag-class-original-imagkk9c8zg4kdjy.jpeg?q=70",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              color: const Color.fromARGB(92, 0, 0, 0),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Catego Name",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 15,
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
