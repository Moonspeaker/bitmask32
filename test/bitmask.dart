import 'package:test/test.dart';
import 'package:bitmask32/bitmask32.dart';

void main() => test("bitmask", (){
  const List<int> bits = [31, 19, 5, 3, 2, 1, 0];
  final int encoded = encodeBitMask(bits);
  final List<int> decoded = decodeBitMask(encoded);
  bool accurate = true;
  if(bits.length == decoded.length){
    for(int i=0; i<bits.length; i++){
      if(bits[i] != decoded[i]){
        accurate = false;
        break;
      }
    }
  } else {accurate = false;}
  expect(accurate, equals(true));
});