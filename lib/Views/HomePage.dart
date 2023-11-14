// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/colors.dart';
import 'package:flutter_application_1/Views/PlantDetails.dart';
import 'package:flutter_application_1/Widgets/productCard.dart';
import 'package:flutter_application_1/Widgets/searchBar.dart';

import '../Models/Plants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Search Products',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
        ),
        backgroundColor: bkColor,
        bottomOpacity: 0,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: CircleAvatar(
              radius: 50,
              child: ClipOval(
                child: Image.asset(
                  'images/profile.jpg',

                  fit: BoxFit.cover, // Set the desired fit property
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          //height: double.infinity,
          decoration: BoxDecoration(gradient: LinearGradient(
              colors: [bkColor, Color.fromARGB(255, 250, 247, 247)],
              //begin: Alignment.topCenter,
              //end: Alignment.bottomCenter,
              stops: [0.0, 1.0])),
          child: Column(
            children: [
              searchbar(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'Found\n',
                              style: TextStyle(
                                fontSize: 35,
                              ),
                            ),
                            TextSpan(
                              text: '10 Results',
                            ),
                          ],
                        ),
                      ),
                      ProductCard(
                        id: 0,
                      ),
                      //3rd container
                      ProductCard(
                        id: 1,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ProductCard(
                       id: 2,
                      ),
                      ProductCard(
                        id: 3,
                      ),
                      ProductCard(
                       id: 4,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

