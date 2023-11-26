
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/CartController.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CartDialogBox extends StatefulWidget {
  const CartDialogBox({super.key});

  @override
  State<CartDialogBox> createState() => _CartDialogBoxState();
}

class _CartDialogBoxState extends State<CartDialogBox> {
  @override
  Widget build(BuildContext context) {
    final CartController _controller =
        Get.put(CartController(), permanent: true);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Order',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < _controller.cartItems.length; i++)
            Obx(
              () {
                if (_controller.cartItems.isNotEmpty &&
          i < _controller.cartItems.length &&
          _controller.cartItems[i].quantity != 0)


             {
              return
               Visibility(
                         visible: true,

                child: Container(
                  alignment: Alignment.centerLeft,
                  width: screenWidth,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_controller.cartItems[i].productName!),
                          Text('\$${_controller.cartItems[i].price}'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _controller.cartItems[i].incrementQuantity();
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              _controller.cartItems[i].decrementQuantity();
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  '-',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          Obx(
                            () => Text('X${_controller.cartItems[i].quantity}'),
                          ),
                          IconButton(
                            onPressed: () {
                              print(
                                  "List length: ${_controller.cartItems.length}, Index: $i");

                              try {
                                if (_controller.cartItems.isNotEmpty &&
                                    i < _controller.cartItems.length) {
                                  _controller
                                      .removeFromCart(_controller.cartItems[i]);
                                } else {
                                  print(
                                      "Index $i is out of bounds or the list is empty");
                                }
                              } catch (e) {
                                print(
                                    "Error: $e. List length: ${_controller.cartItems.length}");
                              }
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
             }else{
              return Visibility(
          visible: false,
          child: Container(),
        );
             }
              }
              
            ),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Obx(() => Text(
                    '\$${_controller.totalAmount().toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
        ],
      ),
    );
  }
}
