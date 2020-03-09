import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib/bindings.dart';

int main(){
  const int INTERVAL = 30;
  const int DIGITS = 6;

  // Base32 secret to utilize
  Pointer<Utf8> BASE32_SECRET = Utf8.toUtf8('JBSWY3DPEHPK3PXP');

  // Create OTPData struct, which decides the environment
  Pointer<OTPData> tdata = totp_new(BASE32_SECRET, SHA1_BITS, hmac_sha1, SHA1_DIGEST, DIGITS, INTERVAL);
  Pointer<OTPData> hdata = hotp_new(BASE32_SECRET, SHA1_BITS, hmac_sha1, SHA1_DIGEST, DIGITS);

  // Dump data members of struct OTPData tdata
  print('\\\\ totp tdata \\\\');
  print('tdata->digits: `${tdata.ref.digits}`');
  print('tdata->interval: `${tdata.ref.interval}`');
  print('tdata->bits: `${tdata.ref.bits}`');
  print('tdata->method: `${tdata.ref.method}`');
  print('tdata->algo: `${tdata.ref.algo}`');
  print('tdata->digest: `${Utf8.fromUtf8(tdata.ref.digest)}`');
  print('tdata->base32_secret: `${Utf8.fromUtf8(tdata.ref.base32_secret)}`');
  print('// totp tdata //\n');

  // Dump data members of struct OTPData hdata
  print('\\\\ hotp tdata \\\\');
  print('hdata->digits: `${hdata.ref.digits}`');
  print('hdata->bits: `${hdata.ref.bits}`');
  print('hdata->method: `${hdata.ref.method}`');
  print('hdata->algo: `${hdata.ref.algo}`');
  print('hdata->digest: `${Utf8.fromUtf8(hdata.ref.digest)}`');
  print('hdata->base32_secret: `${Utf8.fromUtf8(hdata.ref.base32_secret)}`');
  print('// hotp tdata //\n');

  var now = (new DateTime.now()).millisecondsSinceEpoch;
  now = (now / 1000).round();
  print('Current Time: `${now}`');

  // URI Example      
  Pointer<Utf8> name1 = Utf8.toUtf8('name1');
  Pointer<Utf8> name2 = Utf8.toUtf8('name2');
  Pointer<Utf8> whatever1 = Utf8.toUtf8('account@whatever1.com');
  Pointer<Utf8> whatever2 = Utf8.toUtf8('account@whatever2.com');

  // Show example of URIs
  var uri = otpuri_build_uri(tdata, name1, whatever1, 0);
  print('TOTP URI 1: `${Utf8.fromUtf8(uri)}`\n');

  int counter = 52;
  uri = otpuri_build_uri(hdata, name2, whatever2, counter);
  print('HOTP URI 2: `${Utf8.fromUtf8(uri)}`\n');

  // Generate random base32
  const int base32_len = 16;
  Pointer<Utf8> base32_new_secret = Utf8.toUtf8('0'*base32_len);
  otp_random_base32(base32_len, otp_DEFAULT_BASE32_CHARS, base32_new_secret);
  print('Generated BASE32 Secret: `${Utf8.fromUtf8(base32_new_secret)}`\n');

  // Get TOTP for a time block
	//   1. Reserve memory and ensure it's null-terminated
	//   2. Generate and load totp key into buffer
	//   3. Check for error
	//   4. Free data
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
  print('TOTP Generated: `${Utf8.fromUtf8(tcode2)}` `${totp_err_2.toString().padLeft(6,'0')}`');
  free(tcode2);

  // Do a verification for a hardcoded code
  int tv1 = totp_verifyi(tdata, 576203, now, 4); // Won't succeed, this code is for a timeblock far into the past
  int tv2 = totp_verifyi(tdata, 973669, 0, 4); // Will succeed, timeblock 0 for JBSWY3DPEHPK3PXP == 973669

  print("TOTP Verification 1: `${tv1 == 0 ? 'false' : 'true'}`");
  print("TOTP Verification 2: `${tv2 == 0 ? 'false' : 'true'}`");
  print('');

  // Get HOTP for token 1
	//   1. Reserve memory and ensure it's null-terminated
	//   2. Generate and load hotp key into hcode
	//   3. Check for error
	//   3. Free data
  Pointer<Utf8> hcode = Utf8.toUtf8('0'*8);
  int hotp_err_1 = hotp_at(hdata, 1, hcode);
  if (hotp_err_1 == 0) {
    print('HOTP Error 1');
    return 1;
  }
  print('HOTP Generated at 1: `${Utf8.fromUtf8(hcode)}` `${hotp_err_1.toString().padLeft(6,'0')}`');

  // Do a verification for a hardcoded code
  int hv = hotp_verifyi(hdata, 833905, 1); // Will succeed, 1 for JBSWY3DPEHPK3PXP == 833905
  print("HOTP Verification 1: `${hv == 0 ? 'false' : 'true'}`");

  return 0;
}
