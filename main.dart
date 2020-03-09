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

int main(){
  var pathOTPUri = '/home/mrsac7/Desktop/dlls/libotp.so';
  var pathCOTP = '/home/mrsac7/Desktop/dlls/libotp.so';
  var pathCrypt = '/home/mrsac7/Desktop/dlls/libotp.so';

  final dylibOTPUri = DynamicLibrary.open(pathOTPUri);
  final dylibCOTP = DynamicLibrary.open(pathCOTP);
  final dylibCrypt = DynamicLibrary.open(pathCrypt);

  final OTPUriEncodeUrl otpuri_encode_url = dylibOTPUri
  .lookup<NativeFunction<otpuri_encode_url_func>>('otpuri_encode_url')
  .asFunction();
  
  final OTPUriBuildUri otpuri_build_uri = dylibOTPUri
  .lookup<NativeFunction<otpuri_build_uri_func>>('otpuri_build_uri')
  .asFunction();
  
  final TOTPNew totp_new = dylibCOTP
  .lookup<NativeFunction<totp_new_func>>('totp_new')
  .asFunction();

  final Pointer<NativeFunction<COTP_algo_func>> hmac_sha1 = dylibCrypt
  .lookup<NativeFunction<hmac_sha1_func>>('hmac_sha1');

  final OTPRandomBase32 otp_random_base32 = dylibCOTP
  .lookup<NativeFunction<otp_random_base32_func>>('otp_random_base32')
  .asFunction();

  final TOTPNow totp_now = dylibCOTP
  .lookup<NativeFunction<totp_now_func>>('totp_now')
  .asFunction();  

  final TOTPAt totp_at = dylibCOTP
  .lookup<NativeFunction<totp_at_func>>('totp_at')
  .asFunction();

  final TOTPVerifyi totp_verifyi = dylibCOTP
  .lookup<NativeFunction<totp_verifyi_func>>('totp_verifyi')
  .asFunction();

  const int INTERVAL = 30;
  const int DIGITS = 6;
  const int SHA1_BITS = 160;
  Pointer<Utf8> BASE32_SECRET = Utf8.toUtf8('JBSWY3DPEHPK3PXP');
  Pointer<Utf8> SHA1_DIGEST = Utf8.toUtf8('SHA1');
  Pointer<OTPData> tdata = totp_new(BASE32_SECRET, SHA1_BITS, hmac_sha1, SHA1_DIGEST, DIGITS, INTERVAL);

  print('\\\\ totp tdata \\\\');
	print('tdata->digits: `${tdata.ref.digits}`');
	print('tdata->interval: `${tdata.ref.interval}`');
	print('tdata->bits: `${tdata.ref.bits}`');
	print('tdata->method: `${tdata.ref.method}`');
	print('tdata->algo: `${tdata.ref.algo}`');
	print('tdata->digest: `${Utf8.fromUtf8(tdata.ref.digest)}`');
	print('tdata->base32_secret: `${Utf8.fromUtf8(tdata.ref.base32_secret)}`');
	print('// totp tdata //\n');

  var now = (new DateTime.now()).millisecondsSinceEpoch;
  now = (now / 1000).round();
  print('Current Time: `${now}`');

  Pointer<Utf8> name1 = Utf8.toUtf8('name1');
  Pointer<Utf8> name2 = Utf8.toUtf8('name2');
  Pointer<Utf8> whatever1 = Utf8.toUtf8('account@whatever1.com');
  Pointer<Utf8> whatever2 = Utf8.toUtf8('account@whatever2.com');

  final uri = otpuri_build_uri(tdata, name1, whatever1, 0);
  print('TOTP URI 1: `${Utf8.fromUtf8(uri)}`');
  free(uri);
  // srand(now);
  const int base32_len = 16;
  Pointer<Utf8> otp_DEFAULT_BASE32_CHARS = Utf8.toUtf8('ABCDEFGHIJKLMNOPQRSTUVWXYZ234567');
  Pointer<Utf8> base32_new_secret = Utf8.toUtf8('0'*base32_len);
  otp_random_base32(base32_len, otp_DEFAULT_BASE32_CHARS, base32_new_secret);

  print('Generated BASE32 Secret: `${Utf8.fromUtf8(base32_new_secret)}`\n');
  Pointer<Utf8> tcode = Utf8.toUtf8('0'*DIGITS);
  int totp_err_1 = totp_now(tdata, tcode);
  if (totp_err_1 == 0) {
    print('TOTP Error 1');
    return 1;
  }
  print('TOTP Generated: `${Utf8.fromUtf8(tcode)}` `${totp_err_1.toString().padLeft(6,'0')}`');
  free(tcode);

  Pointer<Utf8> tcode2 = Utf8.toUtf8('0'*DIGITS);
  int totp_err_2 = totp_at(tdata, 1, 0, tcode2);
  if (totp_err_2 == 0) {
    print('TOTP Error 2');
    return 1;
  }
  print('TOTP Generated: `${Utf8.fromUtf8(tcode2)}` `${totp_err_2}`');
  free(tcode2);

  int tv1 = totp_verifyi(tdata, 576203, now, 4);
  int tv2 = totp_verifyi(tdata, 973669, 0, 4);

  print("TOTP Verification 1: `${tv1 == 0 ? 'false' : 'true'}`");
  print("TOTP Verification 2: `${tv2 == 0 ? 'false' : 'true'}`");

  return 0;
}