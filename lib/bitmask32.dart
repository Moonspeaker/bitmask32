library bitmask32;

const int _oneBit = 0x01;

class Bitmask32{
  static const int _length = 32;

  static void _fillPositions(final List<bool> bits, final List<int> positionsWhereTrue) =>
      positionsWhereTrue.forEach((final int position) => bits[position] = true);

  final List<bool> _bits;

  void setFlag(final int index, [final bool value = true]) =>
      _bits[index] = value;

  bool getFlag(final int index) =>
      _bits[index];

  void setPositions(final List<int> positions) =>
      _fillPositions(_bits, positions);

  List<int> get positions {
    final List<int> positionsWhereTrue = List();
    for(int i=0; i<_length; i++){
      if(_bits[i]){
        positionsWhereTrue.add(i);
      }
    }
    return positionsWhereTrue;
  }

  int get toInt {
    int value = 0;
    for(int i=0; i<_length; i++){
      if(_bits[i]){
        value = value |= (_oneBit << i);
      }
    }
    return value;
  }

  Bitmask32._(final List<bool> bits) :
      _bits = bits;

  factory Bitmask32() =>
      Bitmask32._(_emptyBitmask);

  static List<bool> get _emptyBitmask =>
      List.filled(_length, false, growable: false);

  factory Bitmask32.fromInt(int bitMask) {
    final List<bool> bits = _emptyBitmask;
    for(int i = _length-1; i >= 0; i--){
      final int power = _oneBit << i;
      if(bitMask >= power){
        bitMask -= power;
        bits[i] = true;
      }
    }
    return Bitmask32._(bits);
  }

  factory Bitmask32.fromPositions(final List<int> positions){
    final List<bool> bits = _emptyBitmask;
    _fillPositions(bits, positions);
    return Bitmask32._(bits);
  }

  @override
  bool operator ==(final Object other) =>
      other is Bitmask32 && other.hashCode == hashCode;

  @override
  int get hashCode => toInt;
}