import 'enums/enums.dart';
import 'models/car.dart';
import 'models/motorcycle.dart';
import 'models/truck.dart';

void main(List<String> args) {
  Car car1 = Car(
    cylinder: 1600,
    maxSpeed: 215,
    engineType: EngineType.gasoline,
    model: "2023",
    manufacturer: "Peugeot",
    price: 1250000,
    transType: TransmissionType.automatic,
    passengers: 5,
  );

  Car car2 = Car(
    cylinder: 1800,
    maxSpeed: 244,
    engineType: EngineType.hybrid,
    model: "2022",
    manufacturer: "BMW",
    price: 2350000,
    transType: TransmissionType.automatic,
    passengers: 5,
  );

  Truck truck1 = Truck(
    cylinder: 2000,
    maxSpeed: 170,
    engineType: EngineType.diesel,
    model: "2015",
    manufacturer: "Chevrolet",
    price: 1215000,
    load: 2000,
  );

  Truck truck2 = Truck(
    cylinder: 1800,
    maxSpeed: 150,
    engineType: EngineType.diesel,
    model: "2024",
    manufacturer: "Daihatsu",
    price: 1720000,
    load: 1250,
  );

  Motorcycle moto1 = Motorcycle(
    cylinder: 750,
    maxSpeed: 110,
    engineType: EngineType.electric,
    model: "2011",
    manufacturer: "Suzuki",
    price: 116000,
    tires: 3,
    hasSideCar: true,
  );

  Motorcycle moto2 = Motorcycle(
    cylinder: 1400,
    maxSpeed: 200,
    engineType: EngineType.gasoline,
    model: "2021",
    manufacturer: "Honda",
    price: 1040500,
    tires: 2,
    hasSideCar: false,
  );

  List<Car> cars = [car1, car2];
  List<Truck> trucks = [truck1, truck2];
  List<Motorcycle> motos = [moto1, moto2];

  print("Fastest Car");
  print(cars.reduce((a, b) => a.maxSpeed > b.maxSpeed ? a : b));

  print("Heaviest Truck");
  print(trucks.reduce((a, b) => a.load > b.load ? a : b));

  print("Cheapiest Motorcycle");
  print(motos.reduce((a, b) => a.price < b.price ? a : b));
}
