class Car {
  final String brand;
  final String model;
  final String image;

  Car({required this.brand, required this.model, required this.image});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      brand: json['brand'] as String,
      model: json['model'] as String,
      image: json['image'] as String,
    );
  }
}
