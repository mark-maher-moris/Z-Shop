import 'package:flutter/material.dart';
import 'package:z_shop/shared/chach_helper.dart';

import '../registration/loginScreen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  var pageController = PageController();
  List<OnBoardingItem> onBoardingItems = [
    OnBoardingItem(
        image: 'assets/onBoarding/1.png',
        subTitle: 'All your needs are here',
        title: 'SHOP NOW'),
    OnBoardingItem(
        image: 'assets/onBoarding/2.png',
        subTitle: 'All your needs are here',
        title: 'Are You Ready'),
    OnBoardingItem(
        image: 'assets/onBoarding/3.png',
        subTitle: 'All your needs are here',
        title: 'Let\'s Go ?'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: PageView.builder(
            controller: pageController,
            physics: BouncingScrollPhysics(),
            itemCount: onBoardingItems.length,
            itemBuilder: (context, index) =>
                buildBoardingItem(onBoardingItems[index], context)));
  }

  Widget buildBoardingItem(OnBoardingItem onBoardingItem, context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              onBoardingItem.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          onBoardingItem.title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          onBoardingItem.subTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 150,
          child: FilledButton(
              style: FilledButton.styleFrom(
                  side: BorderSide(color: Theme.of(context).primaryColor),
                  backgroundColor: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Login >')),
        ),
        FilledButton(
            style: FilledButton.styleFrom(
                side: BorderSide(color: Theme.of(context).primaryColor),
                backgroundColor: Colors.white),
            onPressed: () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            },
            child: Text(
              'Next >',
              style: TextStyle(color: Theme.of(context).primaryColor),
            )),
      ],
    );
  }
}

class OnBoardingItem {
  String image;
  String title;
  String subTitle;
  OnBoardingItem(
      {required this.image, required this.subTitle, required this.title});
}

void finishOnBording(BuildContext context) {
  CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
    if (value == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder:(context)=> LoginScreen()));
    }
  });
}
