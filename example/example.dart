import 'package:bitmask32/bitmask32.dart';

void main(){
  //creates filled with false for each bit
  final Bitmask32 bitmask1 = Bitmask32();

  bitmask1.setFlag(0, true);
  bitmask1.setFlag(1, true);
  //bitmask.setFlag(2, false); redundant
  bitmask1.setFlag(3, true);

  const List<int> secondBitmaskPositions = [0, 1, 3];
  final Bitmask32 bitmask2 = Bitmask32.fromPositions(secondBitmaskPositions);

  assert(bitmask1 == bitmask2);

  bitmask2.setPositions([4, 5]);
  assert(bitmask1 != bitmask2);
}