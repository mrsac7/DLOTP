# DLOTP

This module contains dart:ffi bindings of the COTP library. See https://github.com/tilkinsc/COTP.

A simple One Time Password (OTP) ibrary written in Dart via dart:ffi.

The code currently works on Linux.

Compatible with Authy and Google Authenticator. Full support for QR code url is provided.

## Usage

It uses [CMake](https://cmake.org) to generate a Makefile. To build the native library:

```bash
cd lib/cotp_library
cmake .
make
```
The `make` command creates a `libhello.so` (Linux) library file.

## Running

Once the native library is built, run `pub get` to resolve the dependencies. To run the file:

```bash
dart example/main.dart
```
You would see something like:

```bash
\\ totp tdata \\
tdata->digits: `6`
tdata->interval: `30`
tdata->bits: `160`
tdata->method: `1`
tdata->algo: `Pointer<NativeFunction<(Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>) => Int32>>: address=0x7fba38dad149`
tdata->digest: `SHA1`
tdata->base32_secret: `JBSWY3DPEHPK3PXP`
// totp tdata //

\\ hotp tdata \\
hdata->digits: `6`
hdata->bits: `160`
hdata->method: `2`
hdata->algo: `Pointer<NativeFunction<(Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>) => Int32>>: address=0x7fba38dad149`
hdata->digest: `SHA1`
hdata->base32_secret: `JBSWY3DPEHPK3PXP`
// hotp tdata //

Current Time: `1583774903`
TOTP URI 1: `otpauth://totp/name1:account%4?secret=JBSWY3DPEHPK3PXP&issuer=name1&algorithm=SHA1&digits=6&period=30`

HOTP URI 2: `otpauth://hotp/name2:account%4?secret=JBSWY3DPEHPK3PXP&issuer=name2&algorithm=SHA1&digits=6&counter=52`

Generated BASE32 Secret: `HGJTR7KMJN2LS3DG`

TOTP Generated: `547709` `547709`
TOTP Generated: `973669` `973669`
TOTP Verification 1: `false`
TOTP Verification 2: `true`

HOTP Generated at 1: `833905` `833905`
HOTP Verification 1: `true`
```

## Google Authenticator/Authy Support

Generate a QR code from the URI generated on running `main.dart` and scan it in the app.
