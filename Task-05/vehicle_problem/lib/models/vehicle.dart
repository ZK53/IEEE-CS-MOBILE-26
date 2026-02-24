import '../enums/enums.dart';

abstract class Vehicle {
  final int _cylinder;
  final int _maxSpeed;
  final EngineType _engineType;
  final String _model;
  final String _manufacturer;
  final int _price;

  Vehicle({
    required int cylinder,
    required int maxSpeed,
    required EngineType engineType,
    required String model,
    required String manufacturer,
    required int price,
  }) : _cylinder = cylinder,
       _maxSpeed = maxSpeed,
       _engineType = engineType,
       _model = model,
       _manufacturer = manufacturer,
       _price = price;

  int get cylinder => _cylinder;
  int get maxSpeed => _maxSpeed;
  EngineType get engineType => _engineType;
  String get model => _model;
  String get manufacturer => _manufacturer;
  int get price => _price;

  @override
  String toString() {
    return """
Manufacturer: $manufacturer
Model: $model
Engine Type: ${engineType.name}
CC: $cylinder
Speed: $maxSpeed
Price: $price
""";
  }
}

