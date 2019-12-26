library bitmask32;

const int _oneBit = 0x01;

///Takes a list of integers 31 .. 0, representing indexes of 1
int encodeBitMask(final List<int> positions){
  int value = 0;
  positions.forEach((final int position) => value |= (_oneBit << position));
  return value;
}

List<int> decodeBitMask(int bitMask){ //int is mutable
  final List<int> bits = List(); //second generic type annotation would be redundant
  for(int i = 31; i >= 0; i--){
    final int power = _oneBit << i;
    if(bitMask >= power){
      bitMask -= power;
      bits.add(i);
    }
  }
  return bits;
}
