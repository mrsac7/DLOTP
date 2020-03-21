/// Contains all the function signatures

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'types.dart';

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