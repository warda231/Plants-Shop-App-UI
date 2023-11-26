import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Plants.dart';
import 'package:flutter_application_1/Views/HomePage.dart';
import 'package:flutter_application_1/Views/PlantDetails.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductCard extends StatefulWidget {
  final int id;

  const ProductCard({
    super.key,
    required this.id,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool tap = false;
  int buttonPressed = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final cardWidth = screenWidth * 0.4;
    final cardHeight = screenWidth * 0.6;
    List<PlantProduct> plants = [];

    final PlantProduct product = PlantProduct(
      id: widget.id,
      name: products[widget.id]["name"] ?? '',
      price: (products[widget.id]["price"] as num).toDouble() ?? 0.0,
      imageUrl: products[widget.id]["imageUrl"] ?? '',
      desc: products[widget.id]["desc"] ?? '',
            quantity: products[widget.id]["quantity"]?? 0,

    );


    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => Details(
              id: product.id,
            ),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 800),
          );
        },
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
                    Hero(
                      tag: 'plant-${product.id}',
                      child: Image.asset(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      product.name, // Replace with your product name
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price}', // Replace with your product name
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tap = true;
                            });
                          },
                          child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: tap == false
                                  ? Icon(
                                      CupertinoIcons.heart_fill,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      CupertinoIcons.heart_fill,
                                      color: Colors.red,
                                    )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
