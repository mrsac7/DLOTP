

unsigned long int ft(
                    int t,
                    unsigned long int x,
                    unsigned long int y,
                    unsigned long int z
                    );

int get_testcase(   int test_case,
                    unsigned char *plaintext,
                    unsigned char *key,
                    int *key_length_ptr);


void sha1   (
            unsigned char *message,
            int message_length,
            unsigned char *digest
            );

int hmac_sha1(
                unsigned char *key,
                unsigned char *data,
                unsigned char *digest
                );
