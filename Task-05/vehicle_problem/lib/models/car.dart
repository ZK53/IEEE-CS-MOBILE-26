import '../enums/enums.dart';
import 'vehicle.dart';

class Car extends Vehicle {
  final TransmissionType _transType;
  final int _passengers;

  Car({
    required super.cylinder,
    required super.maxSpeed,
    required super.engineType,
    required super.model,
    required super.manufacturer,
    required super.price,
    required transType,
    required passengers,
  }) : _transType = transType,
       _passengers = passengers;

  TransmissionType get transType => _transType;
  int get passengers => _passengers;

  @override
  String toString() {
    return """${super.toString()}Transimission: ${transType.name}
Passengers: $passengers
""";
  }
}
