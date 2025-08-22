
// ✅ Can be instantiated
// ✅ Can be extended (inside library), subclasses must be base, final, or sealed
// ❌ Cannot be extended (outside library)
// ✅ Can be implemented (inside and outside library), subclasses must be base, final, or sealed


// shapes.dart
base class BaseShape {
  void draw() => print("Drawing shape");
}

final class Circle extends BaseShape {
  @override
  void draw() => print("Drawing circle");
}

sealed class Polygon extends BaseShape {}

base class Square extends Polygon {}



//wont work outside of this library
//other.dart
base class FakeShape implements BaseShape {
  @override
  void draw() => print("Fake shape");
}

//Use base when:
//
// You want controlled inheritance.
// You want to preserve internal guarantees like constructor calls and private member access.
// You expect adding new members in the future without breaking subtypes.