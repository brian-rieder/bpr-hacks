#!/bin/bash

mv /etc/alternatives/gcc-arm-none-eabi-lib.org /etc/alternatives/gcc-arm-none-eabi-lib.org2
mv /etc/alternatives/gcc-arm-none-eabi-lib /etc/alternatives/gcc-arm-none-eabi-lib.org
mv /etc/alternatives/gcc-arm-none-eabi-lib.org2 /etc/alternatives/gcc-arm-none-eabi-lib

mv /usr/lib/gcc/arm-none-eabi/5.4.1/libgcc.a.org /usr/lib/gcc/arm-none-eabi/5.4.1/libgcc.a.org2
mv /usr/lib/gcc/arm-none-eabi/5.4.1/libgcc.a /usr/lib/gcc/arm-none-eabi/5.4.1/libgcc.a.org
mv /usr/lib/gcc/arm-none-eabi/5.4.1/libgcc.a.org2 /usr/lib/gcc/arm-none-eabi/5.4.1/libgcc.a
