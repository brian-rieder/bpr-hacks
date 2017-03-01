#include <stdio.h>

void print_1()    { printf("I"); }
void print_5()    { printf("V"); }
void print_10()   { printf("X"); }
void print_50()   { printf("L"); }
void print_100()  { printf("C"); }
void print_500()  { printf("D"); }
void print_1000() { printf("M"); }

int get_number_to_convert() {
    int input_valid = 0;
    int number_to_convert;
    while(!input_valid) {
        printf("Input a number to convert from 0-1000: ");
        scanf("%d", &number_to_convert);
        if(number_to_convert > 0 && number_to_convert <= 1000)
            input_valid = 1;
    }
    return number_to_convert;
}

void split_number(int original, int* thousands, int* hundreds, int* tens, int* ones) {
    *thousands = original / 1000;
    original -= *thousands * 1000;
    *hundreds = original / 100;
    original -= *hundreds * 100;
    *tens = original / 10;
    original -= *tens * 10;
    *ones = original;
}

void print_digit(int digit, void (*print_msd)(void), void (*print_mid)(void), void (*print_lsd)(void)) {
    switch(digit) {
        case 9:
            print_lsd();
            print_msd();
            break;
        case 4:
            print_lsd();
        case 5:
            print_mid();
            break;
        case 8:
            print_msd();
        case 3:
            print_lsd();
        case 2:
            print_lsd();
        case 1:
            print_lsd();
            break;
        case 7:
            print_mid();
            print_lsd();
            print_lsd();
            break;
        case 6:
            print_mid();
            print_lsd();
            break;
    }
}

void print_roman(int original, int thousands, int hundreds, int tens, int ones) {
    printf("Roman Numerals: ");
    if(thousands)
        print_1000();
    print_digit(hundreds, print_1000, print_500, print_100);
    print_digit(tens, print_100, print_50, print_10);
    print_digit(ones, print_10, print_5, print_1);
    printf("\n");
}

int main(int argc, char** argv) {
    int number_to_convert;
    int thousands, hundreds, tens, ones;

    number_to_convert = get_number_to_convert();
    split_number(number_to_convert, &thousands, &hundreds, &tens, &ones);
    print_roman(number_to_convert, thousands, hundreds, tens, ones);

    return 0;
}
