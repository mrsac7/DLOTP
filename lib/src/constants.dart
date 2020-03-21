/// Constants defined in cotp.h

import 'dart:ffi';
import 'package:ffi/ffi.dart';


Pointer<Utf8> otp_DEFAULT_BASE32_CHARS = Utf8.toUtf8('ABCDEFGHIJKLMNOPQRSTUVWXYZ234567');
const int SHA1_BITS = 160;
const int SHA1_BYTES = 20;
Pointer<Utf8> SHA1_DIGEST = Utf8.toUtf8('SHA1');
Pointer<Utf8> OTP_CHARS = Utf8.toUtf8('otp');
Pointer<Utf8> TOTP_CHARS = Utf8.toUtf8('totp');
Pointer<Utf8> HOTP_CHARS = Utf8.toUtf8('hotp');