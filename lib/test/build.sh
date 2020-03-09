echo 'Building C'
build=`gcc -O0 -g3 -Wall -c ../*.c main.c`
create=`gcc -O0 -g3 -Wall -o test_c.exe otpuri.o cotp.o crypt.o main.o -lcrypto -lm`
echo $build $create
