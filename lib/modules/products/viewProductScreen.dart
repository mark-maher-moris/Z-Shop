import 'package:flutter/material.dart';
import 'package:z_shop/core/themes/themes.dart';

class ViewProductScreen extends StatelessWidget {
  const ViewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(30)),
                      child: Container(
                        color: mainColor,
                        child: Image.network(
                            'https://avatars.githubusercontent.com/u/66829236?v=4'),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Name is here',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '202\$',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 63, 114),
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Connectionless (UDP): UDP is a connectpendently without establishing a connection. It does not guarantee delivery or order of packets, and there is no handshaking process before data transfer.',
                        style: TextStyle(fontSize: 15),
                      ),
                    ]),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 70,
                  width: 120,
                  child: Center(
                      child: Text(
                    'Add To Cart',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(146, 255, 255, 255),
                            blurRadius: 10,
                            spreadRadius: 3,
                            offset: Offset(2, 0))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              )
            ],





            
          ),
        ),
      ),
    );
  }
}
