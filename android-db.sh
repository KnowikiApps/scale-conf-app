#!/bin/sh

adb backup org.qtproject.example.scale_conf

dd if=backup.ab bs=24 skip=1|openssl zlib -d > backup.tar

tar -xf backup.tar