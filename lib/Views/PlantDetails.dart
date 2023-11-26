// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/CartController.dart';
import 'package:flutter_application_1/Models/CartItem.dart';
import 'package:flutter_application_1/Models/Plants.dart';
import 'package:flutter_application_1/Widgets/CartDialog.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.id});
  final int id;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final PageController _pagecontroller = PageController();
  int _currentpg = 0;
        List<PlantProduct> plants = [];


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
        _currentpg = _pagecontroller.page!.round();

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final CartController _controller=Get.put(CartController(),permanent: true);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final PlantProduct product = PlantProduct(
      id: widget.id,
      name: products[widget.id]["name"] ?? '',
      price: (products[widget.id]["price"] as num).toDouble() ?? 0.0,
      imageUrl: products[widget.id]["imageUrl"] ?? '',
      desc: products[widget.id]["desc"] ?? '',
                  quantity: products[widget.id]["quantity"]?? 0,

    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bkColor,
        actions: [

          Stack(
            children: [
              GestureDetector(
                onTap: (){
                   showDialog(
      context: context,
      builder: (BuildContext context) {
        return CartDialogBox();
      },
    );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 28,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child:
              
               Container(
                                padding: EdgeInsets.all(4),

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 59, 107, 61),
                  shape: BoxShape.circle,
                ),
                child: 
                Obx(() =>  Text('${_controller.cartItems.length}',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),)
               
              ))
            ],
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [bkColor, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
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
                        return Hero(
      tag: 'plant-${widget.id}',
                          child: Image.asset(
                            product.imageUrl,
                            fit: BoxFit.cover,
                          ),
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
                product.name,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                product.desc,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 93, 91, 91)),
              ),
            ),
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.28,
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Row(
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
                              '\$${product.price}',
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
                        GestureDetector(
                          onTap: (){
    _controller.addToCart(product);
                          },
                          child: Container(
                            width: screenWidth * 0.4,
                            height: screenHeight * 0.12,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 67, 96, 68),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Add to cart',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
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
