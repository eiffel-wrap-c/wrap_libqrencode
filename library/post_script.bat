@echo on
title post_process script

rem copy c file is there any
rem copy .\manual_wrapper\c\src\*.c  .\generated_wrapper\c\src -- example

rem copy Makefile script
rem copy Makefile-win.SH  .\generated_wrapper\c\src -- example

cd generated_wrapper/eiffel/
del /f qrcode_struct_api.e
cd ..
cd ..

cd generated_wrapper/c/src/
finish_freezing -library
