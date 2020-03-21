import 'dart:ffi';
import 'signatures.dart';
import 'types.dart';

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