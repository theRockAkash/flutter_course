// All except mixin and abstract can be instantiated if they have a public constructor.
// abstract, base, sealed can still have methods with full implementation.
// base, final, sealed are all about controlling subclassing rules.
// interface and abstract can be used for defining contracts.


// ✅ Can be instantiated
// ✅ Can be extended (inside library), subclasses must be base, final, or sealed
// ❌ Cannot be extended (outside library)
// ✅ Can be implemented (inside and outside library), subclasses must be base, final, or sealed
base class B {}


// ✅ Can be instantiated
// ✅ Can be extended or implemented (inside library), subclasses must be base, final, or sealed
// ❌ Can't be extended/implemented outside of its library
final class C {
}

// ❌ Cannot be instantiated directly
// ✅ Can be extended (inside and outside library)
// ✅ Can be implemented (inside and outside library)
// ✅ Can have abstract methods.
abstract class A {
}

// ✅ Can be instantiated
// ✅ Can be implemented (inside and outside library)
// ❌ Cannot extend outside same library
// ❌ Cannot have abstract methods.
interface class D {
}

// ❌ Cannot be instantiated
// ✅ Can be implemented (inside and outside library)
// ❌ Cannot extend outside same library
// ✅ Can have abstract methods.
abstract interface class E {}

// ✅ Can be instantiated if not abstract
// ✅ Can be extended (inside library only)
// ❌ Cannot be extended (outside library)
// ❌ Cannot be implemented (anywhere)
sealed class F {}

// ❌ Cannot be instantiated
// ❌ Cannot be extended
// ❌ Cannot be implemented
// ✅ Can only be applied with `with`
mixin G {
}

// ✅ Can be instantiated
// ✅ Can be extended (inside and outside library)
// ✅ Can be implemented (inside and outside library)
// ✅ Can be applied with `with`
mixin class H {}

