This is specifically for use with Debian in an environment where floating point VLP is an issue.

In this context, the R5 supports hardware floating point VLP, but the Debian 9.5 and 9.6 doesn't handle the cross build env properly:
* An ARM cross build environment that supports {\bf abi=hard} for the R5 processor.
* Different build environments can include the wrong libgcc (-lgcc).

Debian 9.x workaround:

```
mv /etc/alternatives/gcc-arm-none-eabi-lib /etc/alternatives/gcc-arm-none-eabi-lib.org
ln -s /usr/lib/arm-none-eabi/newlib/fpu /etc/alternatives/gcc-arm-none-eabi-lib

mv /usr/lib/gcc/arm-none-eabi/5.4.1/libgcc.a. /usr/lib/gcc/arm-none-eabi/5.4.1/libgcc.a.org
ln -s fpu/libgcc.a /usr/lib/gcc/arm-none-eabi/5.4.1/
```

The script in this repo is for swapping these once this has been done once.
