# COTP Library

A simple One Time Password (OTP) ibrary written in C. See https://github.com/tilkinsc/COTP.

Compatible with Authy and Google Authenticator. Full support for QR code url is provided.

The module contains.

  - `crypt.c` - Contains HMAC_SHA1 encryption algorithm. See http://www.deadhat.com/wlancrypto/hmac_sha1.c
  - `cotp.c` `otpuri.c` - Contains functions defined in the module
  - `main.c` - Working example to demonstrate 

## Running

To test the sample:

```bash
cd test
./build.sh
./test_c.exe
```

The `./build.sh` command creates a `main.o` `cotp.o` `crypt.o` `otpuri.o` and `test_c.exe` files

