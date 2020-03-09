cmake_minimum_required(VERSION 3.7 FATAL_ERROR)
project(dlotp VERSION 1.0.0 LANGUAGES C)
add_library(dlotp SHARED cotp.c cotp.def otpuri.c otpuri.h crypt.c crypt.h)

set_target_properties(dlotp PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    OUTPUT_NAME "otp"
)
