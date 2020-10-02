import 'package:test/test.dart';
import 'package:bitmask32/bitmask32.dart';

void main() => group("bitmask", (){

  test("positions", (){
    expect(() => Bitmask32.fromPositions([0, 32]), throwsRangeError);

    const List<int> positions = [0, 1, 3, 5, 12, 31];
    expect(positions, equals(Bitmask32.fromPositions(positions).positions));
  });

  test("flags", (){
    expect(() => Bitmask32().setFlag(32, true), throwsRangeError);

    final Bitmask32 bitmask = Bitmask32();
    bitmask.setFlag(0, true);
    expect(bitmask.toInt, 0x00000001);
    bitmask.setFlag(8, true);
    expect(bitmask.toInt, 0x00000101);
    bitmask.setFlag(31, true);
    expect(bitmask.toInt, 0x80000101);
    bitmask.setFlag(7, true);
    expect(bitmask.toInt, 0x80000181);
  });
});