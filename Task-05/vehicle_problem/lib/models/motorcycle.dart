import 'vehicle.dart';

class Motorcycle extends Vehicle {
  final int _tires;
  final bool _hasSideCar;

  Motorcycle({
    required super.cylinder,
    required super.maxSpeed,
    required super.engineType,
    required super.model,
    required super.manufacturer,
    required super.price,
    required tires,
    required hasSideCar,
  }) : _tires = tires,
       _hasSideCar = hasSideCar;

  int get tires => _tires;
  bool get hasSideCar => _hasSideCar;

  @override
  String toString() {
    return """${super.toString()}Tires: $tires
Sidecar: $hasSideCar
""";
  }
}
