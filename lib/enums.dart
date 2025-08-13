
//Enums

import 'package:flutter/material.dart';

enum PlanetType { terrestrial, gas, ice }
enum Planet {
  mercury(PlanetType.terrestrial),
  jupiter(PlanetType.gas);

  final PlanetType type;

  const Planet(this.type);
}


enum Fruit {
  apple("Apple", "Red"),
  banana("Banana", "Yellow"),
  orange("Orange", "Orange"),
  grape("Grape", "Purple"),
  jackfruit("jackfruit", "Green");

  final String displayName;
  final String color;

  const Fruit(this.displayName, this.color);

  void print(String color) {
    print(color);
  }
}
enum UploadStatus{

  success("Success", 1),
  failure("Failure", 0),
  inProgress("In Progress", -1);

  final String displayName;
  final int statusCode;
  const UploadStatus(this.displayName, this.statusCode);
}

void main() {

  Fruit.banana.displayName;
  Fruit.banana.print(Fruit.banana.color);
  for (var a in Fruit.values) {
    debugPrint(a.displayName);
  }


}
