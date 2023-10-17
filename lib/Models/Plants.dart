class PlantProduct {
  final String name;
  final double price;
  final String imageUrl;
  final String desc;

  PlantProduct({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.desc,
  });
}

class ProductData {
  static final List<PlantProduct> products = [
    PlantProduct(
        imageUrl: 'images/img1.png',
        price: 20.00,
        name: 'Snake Plant',
        desc: 'Plants fill your life with peace and happiness '),
    PlantProduct(
        imageUrl: 'images/img4.png',
        price: 20.99,
        name: 'Forn Plant',
        desc: 'Plants fill your life with peace and happiness '),
    PlantProduct(
        imageUrl: 'images/img3.jpg',
        price: 20.99,
        name: 'Lucky  Plant',
        desc: 'Plants fill your life with peace and happiness '),
    PlantProduct(
        imageUrl: 'images/img2.jpg',
        price: 20.99,
        name: 'Jade Plant',
        desc: 'Plants fill your life with peace and happiness '),
    PlantProduct(
        imageUrl: 'images/img4.png',
        price: 20.99,
        name: 'Small Plant',
        desc: 'Plants fill your life with peace and happiness '),
  ];
}
