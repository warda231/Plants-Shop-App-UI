import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem{
  final int productId;
  final String productName;
  final double price;
  final RxInt quantity;

   CartItem({
    required this.productId,
    required this.productName,
    required this.price,
    required int initialQuantity,
  }) : quantity = initialQuantity.obs;

  void incrementQuantity() {
    quantity.value++;
  }

  // Example decrement method
  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }
CartItem copyWith({int? productId, String? productName, double? price, RxInt? quantity}) {
  return CartItem(
    productId: productId ?? this.productId,
    productName: productName ?? this.productName,
    price: price ?? this.price,
    initialQuantity: quantity?.value ?? this.quantity.value,
  );
}

}