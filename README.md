# ender3

files for the ender 3 pro printer v1.1.4 (8bit)

# bootloader

This is specifically for the V1.1.4 control board.  The firmware was extracted from the TH3D Bootloader Flashing Package https://support.th3dstudio.com/helpcenter/8-bit-board-bootloader-flashing-guide-for-1284p-cpus/

    $ bootloader/upload.sh [port]

# Marlin firmware

Tutorial: https://www.youtube.com/watch?v=eq_ygvHF29I
Marlin Firmware: https://github.com/MarlinFirmware/Marlin/
Install vscode
Install platformio plugin
Install marlin plugin



DEPRECTATED:

official creality firmware: https://github.com/Creality3DPrinting/Ender-3

- Install Arduio IDE
- Install Sanguino Board: Preferences/Additional Board Manger URL
    https://raw.githubusercontent.com/Lauszus/Sanguino/master/package_lauszus_sanguino_index.json
- Install U8glib: Tools/Manage Libraries/8Uglib


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


## TH3D / Configuration.h

    #define BLTOUCH

    // Here is where you set your servo pin. 
    // PB5 MOSI
    #define SERVO0_PIN 5

    #define NOZZLE_TO_PROBE_OFFSET { -43, -5, 0 }

    #define Z_MIN_PROBE_ENDSTOP_INVERTING false
    //#define Z_MIN_PROBE_USES_Z_MIN_ENDSTOP_PIN
    #define Z_MIN_PROBE_PIN 7 // Pin 7 is the SCK ISCP








## Marlin / Configuration.h


    #define BLTOUCH

    #define Z_MIN_PROBE_ENDSTOP
    #define Z_MIN_PROBE_PIN 7 // Pin 7 is the SCK ISCP


    #define AUTO_BED_LEVELING_BILINEAR

    #define Z_SAFE_HOMING

    #define X_PROBE_OFFSET_FROM_EXTRUDER -43  // X offset: -left  +right  [of the nozzle]
    #define Y_PROBE_OFFSET_FROM_EXTRUDER -5  // Y offset: -front +behind [the nozzle]
    #define Z_PROBE_OFFSET_FROM_EXTRUDER 3  // Z offset: -below +above  [the nozzle]

    // Here is where you set your servo pin. 
    // PB5 MOSI
    #define SERVO0_PIN 5

    #define Z_MIN_PROBE_ENDSTOP_INVERTING true

    // Don't use the default Z pin as it has a capacitor on it
    //#define Z_MIN_PROBE_USES_Z_MIN_ENDSTOP_PIN 

    #define Z_MIN_PROBE_ENDSTOP
    #define Z_MIN_PROBE_PIN 7 // Pin 7 is the SCK ISCP

    #define PROBE_MANUALLY // not sure about this one?

    // The size of the print bed
    #define X_BED_SIZE 235
    #define Y_BED_SIZE 235

    // Set the boundaries for probing (where the probe can reach).
    #define LEFT_PROBE_BED_POSITION 10
    #define RIGHT_PROBE_BED_POSITION 182
    #define FRONT_PROBE_BED_POSITION 10
    #define BACK_PROBE_BED_POSITION 220


## Configuration_adv.h

    #define BABYSTEP_ZPROBE_OFFSET   // Enable to combine M851 and Babystepping


## References

1. generic install https://www.youtube.com/watch?v=eF060dBEnfs
2. https://teachingtechyt.github.io/upgrades.html#bltouch
3. bootloader install https://www.youtube.com/watch?v=fIl5X2ffdyo
4. arduino files for Sanguino 1248p https://github.com/jmgiacalone/sanguino1284p
5. http://3dprintlove.com/3d-printing/adding-bltouch-to-creality-3d-printer-ender-3-for-auto-bed-leveling/
