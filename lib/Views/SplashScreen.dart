// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pagecontroller = PageController();
  int _currentpg = 0;

  final List<String> imges = [
    'images/img1.png',
    'images/img2.png',
    'images/img3.png',
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 217, 215, 215),
            const Color.fromARGB(255, 242, 241, 241),
            Colors.white
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      //primary: Color.fromARGB(255, 217, 215, 215),
                      primary: Color.fromARGB(255, 237, 234, 234),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      //shadowColor: const Color.fromARGB(
                      //255, 204, 203, 203), // Add shadow
                      //elevation: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: 300,
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
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
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Center(
                  child: DotsIndicator(
                    dotsCount: imges.length,
                    position: _currentpg,
                    decorator: DotsDecorator(
                      size: const Size.square(6.0),
                      activeSize: const Size(17.0, 6.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),

                      color: Colors.grey, // Inactive dot color
                      activeColor: Color.fromARGB(255, 98, 152, 100),
                    ),
                  ),
                ),
              ),
              /*Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Container(
                  width: 200,
                  height: 300,
                  child: Image(
                    image: AssetImage('images/img1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),*/
              RichText(
                  text: TextSpan(
                style: TextStyle(
                  fontSize: 38,
                ),
                children: [
                  TextSpan(
                    text: 'Enjoy your\n',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  TextSpan(
                    text: 'Life With ',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  TextSpan(
                    text: 'Plants',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ],
              )),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 98, 152, 100),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: IconButton(
                  onPressed: () {
                    if (_currentpg < imges.length - 1) {
                    _pagecontroller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                    setState(() {
                      _currentpg++;
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 40,
                  color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
