import 'dart:ffi';
import 'package:ffi/ffi.dart';

// Constants declaration
final Pointer<Utf8> otp_DEFAULT_BASE32_CHARS = Utf8.toUtf8('ABCDEFGHIJKLMNOPQRSTUVWXYZ234567');
final int SHA1_BITS = 160;
final int SHA1_BYTES = 20;
final Pointer<Utf8> SHA1_DIGEST = Utf8.toUtf8('SHA1');
final Pointer<Utf8> OTP_CHARS = Utf8.toUtf8('otp');
final Pointer<Utf8> TOTP_CHARS = Utf8.toUtf8('totp');
final Pointer<Utf8> HOTP_CHARS = Utf8.toUtf8('hotp');
 
// Functions and Structs Signatures 
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

typedef otpuri_encode_url_func = Pointer<Utf8> Function(Pointer<Utf8> data, IntPtr data_len);
typedef OTPUriEncodeUrl = Pointer<Utf8> Function(Pointer<Utf8> data, int data_len);
typedef otpuri_build_uri_func = Pointer<Utf8> Function(Pointer<OTPData> data, Pointer<Utf8> issuer, Pointer<Utf8> name, IntPtr counter);
typedef OTPUriBuildUri = Pointer<Utf8> Function(Pointer<OTPData> data, Pointer<Utf8> issuer, Pointer<Utf8> name, int counter);

typedef otp_new_func = Pointer<OTPData> Function(Pointer<Utf8> base32_secret, IntPtr bits, Pointer<NativeFunction<COTP_algo_func>> algo, Pointer<Utf8> digest, IntPtr digits);
typedef OTPNew = Pointer<OTPData> Function(Pointer<Utf8> base32_secret, int bits, Pointer<NativeFunction<COTP_algo_func>> algo, Pointer<Utf8> digest, int digits);
typedef totp_new_func = Pointer<OTPData> Function(Pointer<Utf8> base32_secret, IntPtr bits, Pointer<NativeFunction<COTP_algo_func>> algo,Pointer<Utf8> digest, IntPtr digits, IntPtr interval);
typedef TOTPNew = Pointer<OTPData> Function(Pointer<Utf8> base32_secret, int bits, Pointer<NativeFunction<COTP_algo_func>> algo,Pointer<Utf8> digest, int digits, int interval);
typedef hotp_new_func = Pointer<OTPData> Function(Pointer<Utf8> base32_secret, IntPtr bits, Pointer<NativeFunction<COTP_algo_func>> algo,Pointer<Utf8> digest, IntPtr digits);
typedef HOTPNew = Pointer<OTPData> Function(Pointer<Utf8> base32_secret, int bits, Pointer<NativeFunction<COTP_algo_func>> algo,Pointer<Utf8> digest, int digits);

typedef otp_free_func = Void Function(Pointer<OTPData> data);
typedef OTPFree = void Function(Pointer<OTPData> data);

typedef otp_generate_func = Int32 Function(Pointer<OTPData> data, Int32 input, Pointer<Utf8> out_str);
typedef OTPGenerate = int Function(Pointer<OTPData> data, int input, Pointer<Utf8> out_str);
typedef otp_byte_secret_func = Int32 Function(Pointer<OTPData> data, IntPtr size, Pointer<Utf8> out_str);
typedef OTPByteSecret = int Function(Pointer<OTPData> data, int size, Pointer<Utf8> out_str);
typedef otp_int_to_bytestring_func = Int32 Function(Int32 integer, Pointer<Utf8> out_str);
typedef OTPIntToBytestring = int Function(int integer, Pointer<Utf8> out_str);
typedef otp_random_base32_func = Int32 Function(IntPtr len, Pointer<Utf8> chars, Pointer<Utf8> out_str);
typedef OTPRandomBase32 = int Function(int len, Pointer<Utf8> chars, Pointer<Utf8> out_str);

typedef totp_compares_func = Int32 Function(Pointer<OTPData> data, Pointer<Utf8> key, IntPtr increment, Uint32 for_time);
typedef TOTPCompares = int Function(Pointer<OTPData> data, Pointer<Utf8> key, int increment, int for_time);
typedef totp_comparei_func = Int32 Function(Pointer<OTPData> data, Int32 key, IntPtr increment, Uint32 for_time);
typedef TOTPComparei = int Function(Pointer<OTPData> data, int key, int increment, int for_time);
typedef totp_at_func = Int32 Function(Pointer<OTPData> data, Uint32 for_time, IntPtr counter_offset, Pointer<Utf8> out_str);
typedef TOTPAt = int Function(Pointer<OTPData> data, int for_time, int counter_offset, Pointer<Utf8> out_str);
typedef totp_now_func = Int32 Function(Pointer<OTPData> data, Pointer<Utf8> out_str);
typedef TOTPNow = int Function(Pointer<OTPData> data, Pointer<Utf8> out_str);
typedef totp_verifyi_func = Int32 Function(Pointer<OTPData> data, Int32 key, Uint32 for_time, Int32 valid_window);
typedef TOTPVerifyi = int Function(Pointer<OTPData> data, int key, int for_time, int valid_window);
typedef totp_verifys_func = Int32 Function(Pointer<OTPData> data, Pointer<Utf8> key, Uint32 for_time, Int32 valid_window);
typedef TOTPVerifys = int Function(Pointer<OTPData> data, Pointer<Utf8> key, int for_time, int valid_window);
typedef totp_valid_until_func = Uint32 Function(Pointer<OTPData> data, Uint32 for_time, IntPtr valid_window);
typedef TOTPValidUntil = int Function(Pointer<OTPData> data, int for_time, int valid_window);
typedef totp_timecode_until_func = Int32 Function(Pointer<OTPData> data, Uint32 for_time);
typedef TOTPTimecodeUntil = int Function(Pointer<OTPData> data, int for_time);

typedef hmac_sha1_func = Int32  Function(Pointer<Utf8> key, Pointer<Utf8> data, Pointer<Utf8> digest);
typedef HMACSHA1 = int Function(Pointer<Utf8> key, Pointer<Utf8> data, Pointer<Utf8> digest);

typedef hotp_compares_func = Int32 Function(Pointer<OTPData> data, Pointer<Utf8> key, IntPtr counter);
typedef HOTPCompares = int Function(Pointer<OTPData> data, Pointer<Utf8> key, int counter);
typedef hotp_comparei_func = Int32 Function(Pointer<OTPData> data, Int32 key, IntPtr counter);
typedef HOTPComparei = int Function(Pointer<OTPData> data, int key, int counter);
typedef hotp_at_func = Int32 Function(Pointer<OTPData> data, IntPtr counter, Pointer<Utf8> out_str);
typedef HOTPAt = int Function(Pointer<OTPData> data, int counter, Pointer<Utf8> out_str);
typedef hotp_verifyi_func = Int32 Function(Pointer<OTPData> data, Int32 key, IntPtr counter);
typedef HOTPVerifyi = int Function(Pointer<OTPData> data, int key, int counter);
typedef hotp_verifys_func = Int32 Function(Pointer<OTPData> data, Pointer<Utf8> key, IntPtr counter);
typedef HOTPVerifys = int Function(Pointer<OTPData> data, Pointer<Utf8> key, int counter);

// Bindings
var path = './lib/cotp_library/libotp.so';
final dylib = DynamicLibrary.open(path);

final OTPUriEncodeUrl otpuri_encode_url = dylib
.lookup<NativeFunction<otpuri_encode_url_func>>('otpuri_encode_url')
.asFunction();

final OTPUriBuildUri otpuri_build_uri = dylib
.lookup<NativeFunction<otpuri_build_uri_func>>('otpuri_build_uri')
.asFunction();

final TOTPNew totp_new = dylib
.lookup<NativeFunction<totp_new_func>>('totp_new')
.asFunction();

final Pointer<NativeFunction<COTP_algo_func>> hmac_sha1 = dylib
.lookup<NativeFunction<hmac_sha1_func>>('hmac_sha1');

final OTPRandomBase32 otp_random_base32 = dylib
.lookup<NativeFunction<otp_random_base32_func>>('otp_random_base32')
.asFunction();

final TOTPNow totp_now = dylib
.lookup<NativeFunction<totp_now_func>>('totp_now')
.asFunction();  

final TOTPAt totp_at = dylib
.lookup<NativeFunction<totp_at_func>>('totp_at')
.asFunction();

final TOTPVerifyi totp_verifyi = dylib
.lookup<NativeFunction<totp_verifyi_func>>('totp_verifyi')
.asFunction();

final HOTPNew hotp_new = dylib
.lookup<NativeFunction<hotp_new_func>>('hotp_new')
.asFunction();

final HOTPAt hotp_at = dylib
.lookup<NativeFunction<hotp_at_func>>('hotp_at')
.asFunction();

final HOTPVerifyi hotp_verifyi = dylib
.lookup<NativeFunction<hotp_verifyi_func>>('hotp_verifyi')
.asFunction();