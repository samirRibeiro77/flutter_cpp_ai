import 'dart:ffi';
import 'dart:io';

class MathBindings {
  static final MathBindings instance = MathBindings._internal();

  late final DynamicLibrary _nativeLib;

  late final int Function(int x, int y) addNumbers;

  MathBindings._internal() {
    _nativeLib = _loadLibrary();
    _loadFunctions();
  }

  DynamicLibrary _loadLibrary() {
    if (Platform.isAndroid) {
      return DynamicLibrary.open("libmath_operations.so");
    } else if (Platform.isIOS || Platform.isMacOS) {
      return DynamicLibrary.process();
    }
    throw UnsupportedError("Unsupported platform");
  }

  _loadFunctions() {
    addNumbers = _nativeLib
        .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("add_numbers")
        .asFunction();
  }
}
