# DLOTP

This module contains dart:ffi bindings of the COTP library. See https://github.com/tilkinsc/COTP.
A simple One Time Password (OTP) ibrary written in Dart via dart:ffi.
The code currently works on Linux.
Compatible with Authy and Google Authenticator. Full support for QR code url is provided.

## Usage

It uses [CMake](https://cmake.org) to generate a Makefile. To build the native library:

```bash
cd lib
cmake .
make
```
The `make` command creates a `libhello.so` (Linux) library file.

## Running

Once the native library is built, run `pub get` to resolve the dependencies then run `dart <filename>.dart`.
