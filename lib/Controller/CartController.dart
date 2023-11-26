import 'package:flutter_application_1/Models/CartItem.dart';
import 'package:flutter_application_1/Models/Plants.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addToCart(PlantProduct product) {
    var existingItem = cartItems.firstWhere(
      (item) => item.productId == product.id,
      orElse: () => CartItem(productId: product.id, productName: product.name, price: product.price, initialQuantity: 0),
    );

    if (!cartItems.contains(existingItem)) {
      cartItems.add(existingItem.copyWith(quantity: RxInt(1)));
    } else {
      existingItem.incrementQuantity();
    }

    update(); // Notify listeners
  }

  // Other methods...

  double totalAmount() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity.value;
    }
    return total;
  }

   void removeFromCart(CartItem item) {
  if (item.quantity.value > 0) {
  
    cartItems.remove(item);
  }
  update(); // Notify listeners
}

}

