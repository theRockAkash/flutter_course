
/// interface
// ✅ Can be instantiated
// ❌ Cannot extend outside same library
// ❌ Cannot have abstract methods.
// ✅ Can be implemented (inside and outside library)

/// abstract interface
// ❌ Cannot be instantiated
// ❌ Cannot extend outside same library
// ✅ Can be implemented (inside and outside library)
// ✅ Can have abstract methods.


abstract interface class CameraDriver {

  void takePhoto(); // abstract

  void connect() {
    print("Camera connected");
  }
}

class AndroidCameraDriver implements CameraDriver {
  @override
  void takePhoto() => print("Android photo");

  @override
  void connect() => print("Android connect");
}


class IOSCameraDriver extends CameraDriver {
  @override
  void takePhoto() => print("iOS photo");
}

void main(){
  final driver = IOSCameraDriver();
  driver.takePhoto();
  driver.connect();

}