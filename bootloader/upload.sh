# exit when any command fails
set -e

if [ -z "$1" ]
then
    echo "No port supplied"
    echo "known ports:"
    echo
    ls -1 /dev/cu.*
    echo
    exit
fi

# erase and unlock

bootloader/avrdude  \
  -C bootloader/avrdude.conf \
   -v -p atmega1284p -c stk500v1 -P $1 -b 19200 -e \
   -U lock:w:0x3F:m -U efuse:w:0xFD:m -U hfuse:w:0xDE:m -U lfuse:w:0xFF:m

# upload bootloader and lock

bootloader/avrdude \
 -C bootloader/avrdude.conf \
 -v -p atmega1284p -c stk500v1 -P $1 -b 19200 \
 -U flash:w:bootloader/optiboot_atmega1284p.hex:i \
 -U lock:w:0x0F:m