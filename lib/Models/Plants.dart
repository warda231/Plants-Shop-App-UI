class PlantProduct {
  final String name;
  final double price;
  final String imageUrl;
  final String desc;
  final int id;
    final int quantity;


  PlantProduct({
    required this.name,
    required this.id,
    required this.price,
    required this.imageUrl,
    required this.desc, required this.quantity, 
  });
}

List<Map<String, dynamic>> products = [
  {
    "imageUrl": 'images/img1.png',
    "price": 20.00,
    "name": 'Snake Plant',
    "desc": 'Plants fill your life with peace and happiness ',
  },
  {
    "imageUrl": 'images/img4.png',
    "price": 20.99,
    "name": 'Forn Plant',
    "desc": 'Plants fill your life with peace and happiness ',

  },
  {
    "imageUrl": 'images/img3.png',
    "price": 20.99,
    "name": 'Lucky  Plant',
    "desc": 'Plants fill your life with peace and happiness ',

  },
  {
    "imageUrl": 'images/img2.png',
    "price": 20.99,
    "name": 'Jade Plant',
    "desc": 'Plants fill your life with peace and happiness ',

  },
  {
    "imageUrl": 'images/img4.png',
    "price": 20.99,
    "name": 'Small Plant',
    "desc": 'Plants fill your life with peace and happiness ',

  },
];
