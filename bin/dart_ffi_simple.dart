import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'package:path/path.dart' as path;

typedef HelloWorldFunc = ffi.Void Function();
typedef HelloWorld = void Function();

void main(List<String> arguments) {
  //open the dynamic library
  var libraryPath =
      path.join(Directory.current.path, 'hello_library', 'libhello.so');

  if (Platform.isMacOS) {
    libraryPath =
        path.join(Directory.current.path, 'hello_library', 'libhello.dylib');
  }

  if (Platform.isWindows) {
    libraryPath =
        path.join(Directory.current.path, 'hello_library', 'libhello.dll');
  }

  final dylib = ffi.DynamicLibrary.open(libraryPath);
  // look up the C function
  final HelloWorld hello = dylib
      .lookup<ffi.NativeFunction<HelloWorldFunc>>('hello_world')
      .asFunction();
  hello();
}
