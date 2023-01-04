# ender3

files for the ender 3 pro printer v1.1.4 (8bit)

# bootloader

This is specifically for the V1.1.4 control board.  The firmware was extracted from the TH3D Bootloader Flashing Package https://support.th3dstudio.com/helpcenter/8-bit-board-bootloader-flashing-guide-for-1284p-cpus/

    $ bootloader/upload.sh [port]

# Marlin firmware

Tutorial: https://www.youtube.com/watch?v=eq_ygvHF29I
Marlin Firmware: https://github.com/MarlinFirmware/Marlin/
Marlin Configs: https://github.com/MarlinFirmware/Marlin/tree/bugfix-2.1.x/config
Install vscode
Install platformio plugin
Install marlin plugin

# bltouch install

The wiring for the BLTouch recieved from Amazon/Creality appears to have a completely reversed colour code to
what is expected:

Looking at the BLTouch connector with the probe at the bottom:


| GND   | Vcc   | In/Servo | GND | Out/Zmin |
|-------|-------|----------|-----|----------|
| White | Black | Yellow   | Red | Blue     |


Ender V1.1.5 ISCP header

| Inside |      | Outside |        |
|--------|------|---------|--------|
| MISO   |      | Vcc     | Black  |
| SCK    | Blue | MOSI    | Yellow |
| RESET  |      | GND     | White  |


    +++ b/Marlin/Marlin/Configuration.h
    +//#define Z_MIN_PROBE_USES_Z_MIN_ENDSTOP_PIN
    +#define USE_PROBE_FOR_Z_HOMING
    +#define Z_MIN_PROBE_PIN 7 // Pin 7 is the SCK ISCP
    +#define BLTOUCH
    +#define NOZZLE_TO_PROBE_OFFSET { -43, -5, 0 }
    +#define Z_SAFE_HOMING
    +//#define SDSUPPORT

    +++ b/Marlin/Marlin/src/pins/sanguino/pins_MELZI_CREALITY.h
    +    #define SERVO0_PIN                        5 // PB5 MOSI

## References

1. generic install https://www.youtube.com/watch?v=eF060dBEnfs
2. https://teachingtechyt.github.io/upgrades.html#bltouch
3. bootloader install https://www.youtube.com/watch?v=fIl5X2ffdyo
4. arduino files for Sanguino 1248p https://github.com/jmgiacalone/sanguino1284p
5. http://3dprintlove.com/3d-printing/adding-bltouch-to-creality-3d-printer-ender-3-for-auto-bed-leveling/
