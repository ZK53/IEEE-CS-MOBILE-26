import 'vehicle.dart';

class Truck extends Vehicle {
  final int _load;

  Truck({
    required super.cylinder,
    required super.maxSpeed,
    required super.engineType,
    required super.model,
    required super.manufacturer,
    required super.price,
    required load,
  }) : _load = load;

  int get load => _load;

  @override
  String toString() {
    return """${super.toString()}Load: $load
 """;
  }
}
