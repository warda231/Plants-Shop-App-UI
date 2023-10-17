// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Plants.dart';

import '../Utils/colors.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final PageController _pagecontroller = PageController();
  int _currentpg = 0;

  final List<String> imges = [
    'images/img1.png',
    'images/img2.jpg',
    'images/img3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pagecontroller.addListener(() {
      setState(() {
        _currentpg = _pagecontroller.page! as int;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<PlantProduct> products = ProductData.products;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bkColor,
        bottomOpacity: 0,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Icon(
            Icons.shopping_cart,
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        //height: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(
            colors: [bkColor, Colors.white],
            //begin: Alignment.topLeft,
            //end: Alignment.bottomRight,
            stops: [0.0, 1.0])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.5,
                  child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      controller: _pagecontroller,
                      itemCount: imges.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imges[index],
                          fit: BoxFit.cover,
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 200,
                  ),
                  child: Center(
                    child: DotsIndicator(
                      dotsCount: imges.length,
                      position: _currentpg,
                      axis: Axis.vertical,
                      decorator: DotsDecorator(
                        size: const Size.square(6.0),
                        activeSize: const Size(
                          4.0,
                          15.0,
                        ),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),

                        color: Colors.grey, // Inactive dot color
                        activeColor: Color.fromARGB(255, 98, 152, 100),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                products[0].name,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                products[0].desc,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 93, 91, 91)),
              ),
            ),
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.3,
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ContainerIconandText(
                        icon: CupertinoIcons.arrow_turn_left_up,
                        text: 'Height',
                        desc: '30cm-40cm',
                      ),
                      ContainerIconandText(
                        icon: CupertinoIcons.thermometer,
                        text: 'Temparature',
                        desc: '20C-25C',
                      ),
                      ContainerIconandText(
                        icon: CupertinoIcons.arrow_up_bin_fill,
                        text: 'Pot',
                        desc: 'Flor Pot',
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total Price',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '\$${products[0].price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.12,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 67, 96, 68),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerIconandText extends StatelessWidget {
  const ContainerIconandText({
    super.key,
    required this.icon,
    required this.text,
    required this.desc,
  });

  final IconData icon;
  final String text;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: 60,
        height: 70,
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            Text(
              desc,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
