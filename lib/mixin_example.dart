// ❌ Cannot be instantiated
// ❌ Cannot be extended
// ❌ Cannot be implemented
// ✅ Can only be applied with `with`

// Mixin
mixin CanRun {
  var speed = 100;

  void run() => print("Running at $speed...");
}

// Using with (reuses behavior without hierarchy)
//	Purpose: Mix in methods/properties from another class (mixin)
//	Inherits Implementation: Yes (can reuse code)
//	Must Override All Methods: No (override only if needed)
//	Multiple Inheritance: Yes (can use multiple mixins)
// Use Case: Sharing behavior without hierarchy
class Cheetah with CanRun {

  void makeSound() => print("Roar!");

  @override
  void run() {
    super.run();
  }
}

void main(){
  final cheetah=Cheetah();
  cheetah.makeSound();
  cheetah.run();
}
