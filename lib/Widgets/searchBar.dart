import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchbar extends StatelessWidget {
  const searchbar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 40,
            width: screenWidth * 0.7, // Responsive width
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 228, 224, 224),
                  Colors.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: '  Plants',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.black),
              ),
            ),
          ),
          Container(
            width: screenWidth * 0.1, // Responsive width
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 217, 215, 215),
                  Colors.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Icon(
                CupertinoIcons.slider_horizontal_3,
                color: Colors.black,
                size: 25.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
