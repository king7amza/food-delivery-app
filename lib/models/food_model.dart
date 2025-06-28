class FoodModel {
  final String name;
  final String imageUrl;
  final double price;
  final bool isFavorite;

  const FoodModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });

  FoodModel copyWith({
    String? name,
    String? imageUrl,
    double? price,
    bool? isFavorite,
  }) {
    return FoodModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

}

List<FoodModel> food = [
  FoodModel(
    name: "Burger",
    imageUrl:
        "https://www.freepnglogos.com/uploads/burger-png/download-hamburger-burger-png-image-png-image-pngimg-32.png",
    price: 82,
  ),
  FoodModel(
    name: "chicken",
    imageUrl:
        "https://www.freepnglogos.com/uploads/barbecue-png/barbecue-cbb-crazypng-cbb-eabpng-crazypng-cbb-eabpng-11.png",
    price: 61,
  ),
  FoodModel(
    name: "shawerma",
    imageUrl:
        "https://i.postimg.cc/W3tt43Yf/db8c58af566f4aa66f470b1ee74cd81d.png",
    price: 57,
  ),
  FoodModel(
    name: "faheta",
    imageUrl:
        "https://i.postimg.cc/tgfGhtzy/fajita-with-white-background-high-quality-ultra-hd-free-photo.png",
    price: 78,
  ),
  FoodModel(
    name: "kofta",
    imageUrl:
        "https://i.postimg.cc/kgKSrfBY/istockphoto-1190045343-612x612.png",
    price: 44,
  ),
  FoodModel(
    name: "crispy",
    imageUrl: "https://i.postimg.cc/bNTJ1WSh/download.png",
    price: 63,
  ),
  FoodModel(
    name: "shawerma",
    imageUrl:
    "https://i.postimg.cc/W3tt43Yf/db8c58af566f4aa66f470b1ee74cd81d.png",
    price: 57,
  ),
  FoodModel(
    name: "faheta",
    imageUrl:
    "https://i.postimg.cc/tgfGhtzy/fajita-with-white-background-high-quality-ultra-hd-free-photo.png",
    price: 78,
  ),
  FoodModel(
    name: "kofta",
    imageUrl:
    "https://i.postimg.cc/kgKSrfBY/istockphoto-1190045343-612x612.png",
    price: 44,
  ),
  FoodModel(
    name: "crispy",
    imageUrl: "https://i.postimg.cc/bNTJ1WSh/download.png",
    price: 63,
  ),
];
