import 'package:dart_ffi_simple/dart_ffi_simple.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
}
