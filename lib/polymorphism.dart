
/// Compile-time Polymorphism (Static)
//
// 1. Method Overloading
//
// 2. Operator Overloading (limited in Java, e.g., + for String)
//
/// Runtime Polymorphism (Dynamic)
//
// 3. Method Overriding
//
// 4. Interface Implementation
//
// 5. Abstract Class Implementation

///1. Method Overloading
// Not supported directly — method names must be unique; however, you can simulate overloading using:
// Optional positional parameters

void greet([String name="" ,int? contact ]) {
  print("Hello, $name");
}

void sayHello({required String name ,int? contact}) {
  print("Hello, $name");
}

 void main1() {
   greet(); // Hello, Guest
   greet(); // Hello, Akash
   sayHello(name: "Akash"); // Hello, Akash
   sayHello(name:"",contact: 12345346); // Hello, Akash

   var p1 = Point(1, 2);
   var p2 = Point(3, 4);
   var p3 = p1 + p2;
   print("(${p3.x}, ${p3.y})"); // (4, 6)

   final list1 = [1,2,3];
   final list2 = [4,5,6];
   final list3 = list1 + list2;
   print(list3); // [1, 2, 3, 4, 5, 6]
}

///2. Operator Overloading
// Dart: Supported for custom classes using the operator keyword.
class Point {
  final int x, y;
  Point(this.x, this.y);

  Point operator +(Point other) => Point(x + other.x, y + other.y);
}


extension SomeExtentions<T> on List<T>{
  List<T> operator +(List<T> other) => [...this, ...other];
}




///3. Method Overriding
// Dart: Supported using @override.

class Animal {
  void speak() {
    print("Animal sound");
  }
}

class Dog extends Animal {
  @override
  void speak() {
    super.speak();
    print("Bark");
  }
}

void main() {
  Animal a = Dog();
  a.speak(); // Bark
}

///4. Interface Implementation
//Dart: No separate interface keyword — every class is implicitly an interface.
// Use implements to treat a class as an interface (must override all members).
class Runner {
  void run() {}
}

class Athlete implements Runner,Shape {
  @override
  void run() => print("Running fast");

  @override
  void draw() {
  }
}

///5. Abstract Class Implementation
//Dart: Works the same way using abstract keyword in java.

abstract class Shape {
  void draw(); // abstract method
}

class Circle extends Shape {
  @override
  void draw() => print("Drawing a circle");
}
