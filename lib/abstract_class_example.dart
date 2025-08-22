// ❌ Cannot be instantiated directly
// ✅ Can be extended (inside and outside library)
// ✅ Can be implemented (inside and outside library)
// ✅ Can have abstract methods.

abstract class Animal {
  void eat();
  void sleep() => print("Sleeping...");
}

class Dog extends Animal {
  @override
  void eat() => print("Dog eats bone");

  @override
  void sleep(){

    super.sleep();
  }
}

class RobotDog implements Animal {
  @override
  void eat() => print("RobotDog recharges");
  @override
  void sleep() => print("RobotDog powers down");
}




abstract class Shape {
  const Shape();

  // Factory constructor that returns a concrete subclass
  factory Shape.square(double size) = Square;
  factory Shape.circle(double radius) = Circle;
  void drawShape();
}

class Square implements Shape {
  final double size;
  const Square(this.size);

  @override
  void drawShape() {
    print("drawing Square");
  }
}

class Circle implements Shape {
  final double radius;
  const Circle(this.radius);

  @override
  void drawShape() {
    print("drawing Circle");
  }
}

void main() {
  Shape s1 = Shape.square(5);   // returns a Square
  Shape s2 = Shape.circle(2.5); // returns a Circle

  print(s1); // Instance of 'Square'
  print(s2); // Instance of 'Circle'
}

//Example Two
abstract class PaymentProcessor {
  void process(double amount); // subclasses must implement
}

class StripeProcessor extends PaymentProcessor {
  @override
  void process(double amount) => print("Processing via Stripe: $amount");
}

class PayPalProcessor extends PaymentProcessor {
  @override
  void process(double amount) => print("Processing via PayPal: $amount");
}
