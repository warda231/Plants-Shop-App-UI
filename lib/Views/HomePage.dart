// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/colors.dart';
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
    List<PlantProduct> products = ProductData.products;

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
                        imageUrl: products[0].imageUrl,
                        price: products[0].price,
                        name: products[0].name,
                      ),
                      //3rd container
                      ProductCard(
                        imageUrl: products[1].imageUrl,
                        price: products[1].price,
                        name: products[1].name,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ProductCard(
                        imageUrl: products[2].imageUrl,
                        price: products[2].price,
                        name: products[2].name,
                      ),
                      ProductCard(
                        imageUrl: products[3].imageUrl,
                        price: products[3].price,
                        name: products[3].name,
                      ),
                      ProductCard(
                        imageUrl: products[4].imageUrl,
                        price: products[4].price,
                        name: products[4].name,
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

class ProductCard extends StatelessWidget {
  final String imageUrl;

  final double price;

  final String name;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the card width and height based on screen size
    final cardWidth = screenWidth * 0.4;
    final cardHeight = screenWidth * 0.6;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            // height: 500,
            //width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    name, // Replace with your product name
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${price}', // Replace with your product name
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
