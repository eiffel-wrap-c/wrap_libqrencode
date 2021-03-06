# wrap_libqrencode
`wrap_libqrencode` is an Eiffel binding of [libqrencode](https://github.com/fukuchi/libqrencode) 
using [WrapC](https://github.com/eiffel-wrap-c/WrapC) tool.

Libqrencode((https://github.com/fukuchi/libqrencode) ) is a fast and compact library for encoding data in a QR Code, a 2D symbology that can be scanned by handy terminals such as a smartphone. The capacity of QR Code is up to 7000 digits or 4000 characters and has high robustness. 

## Requirements 


*  [WrapC](https://github.com/eiffel-wrap-c/WrapC) tool.
*  [libqrencode](https://github.com/fukuchi/libqrencode).

A fast and compact QR Code encoding library https://fukuchi.org/works/qrencode/

## Download and  Install

### Linux

Get the sources from https://github.com/fukuchi/libqrencode

Required packages on Ubuntu to install libqrencode

	autoconf
	automake
	autotools-dev
	libtool
	pkg-config
	libpng12-dev

Now you can compile the library using the following commands

	./configure
	make
	sudo make install
	sudo ldconfig

This compiles and installs the library and header file to the appropriate directories: by default, /usr/local/lib and /usr/local/include. 

Alternatively you can use vckpg 

	vckpg install libqrencode

### Windows
Using vcpkg (https://github.com/microsoft/vcpkg) tool, you can install libqrencode library

	vcpkg install libqrencode:x64-windows-static
	
Then copy the `qrencode.lib` to `%LIBRARY_PATH%wrap_library/library/C/lib`


## Status

Work in progress

## Examples
* [Example 01](./examples/01_example) 		`shows how to use qrencode library`

### How to compile the C library glue code.

Before to use the examples you will need to compile the C glue code, go to 

	library/generated_wrapper/c/src

and run

	finish_freezing --library

It will copy the C lib `eif_qrencode.a` to `$ECF_CONFIG_PATH/C/spec/$(ISE_PLATFORM)/lib` or `eif_qrencode.lib` to `$ECF_CONFIG_PATH/C/spec/$ISE_C_COMPILER/$ISE_PLATFORM/lib`

