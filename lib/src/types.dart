/// Definitions of all structs used by GLFW

import 'dart:ffi';
import 'package:ffi/ffi.dart';


typedef COTP_algo_func = Int32 Function(Pointer<Utf8> key, Pointer<Utf8> data, Pointer<Utf8> digest);

class OTPData extends Struct {
  @IntPtr()
  int digits;
  @IntPtr()
  int interval;
  @IntPtr()
  int bits;
  @Int8() 
  int method;
  Pointer<NativeFunction<COTP_algo_func>> algo;
  Pointer<Utf8> digest;
  Pointer<Utf8> base32_secret;
  factory OTPData.allocate(
    int digits, 
    int interval, 
    int bits, 
    Pointer<NativeFunction<COTP_algo_func>> algo,
    int method,
    Pointer<Utf8> digest,
    Pointer<Utf8> base32_secret
    ) => 
    allocate<OTPData>().ref
      ..digits = digits
      ..interval = interval
      ..bits = bits
      ..algo = algo
      ..method = method
      ..digest = digest
      ..base32_secret = base32_secret;
}
