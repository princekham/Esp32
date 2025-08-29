- If dropped from 3000 ft, the speed at 30 ft above the ground would be 437 ft/s
- If from 1500 ft, the speed at 30 ft above the ground would be 308 ft/s
- processing speed required - <50ms

# Proximity Sensor

## XM125
- https://docs.sparkfun.com/SparkFun_Qwiic_Pulsed_Radar_Sensor_XM125/hardware_hookup/#connecting-a-usb-and-qwiic-cable
- https://docs.sparkfun.com/SparkFun_Qwiic_Pulsed_Radar_Sensor_XM125/assets/component_documentation/XM125_datasheet-3133248.pdf

  ![image](https://github.com/user-attachments/assets/52b811a8-5aef-4f4f-bdf1-8ccc8a96b7b7)

- can set the detection range like from 300 to 7000 mm as in the arduino example "Example09_DistanceAdvancedSettings"
- https://docs.sparkfun.com/SparkFun_Qwiic_XM125_Arduino_Library/

- to buy (https://th.mouser.com/ProductDetail/Acconeer/XM125?qs=amGC7iS6iy8ql%2Fsw4HBAJQ%3D%3D&srsltid=AfmBOooHcbRUJW7ViT1mwnXGpLJL7LjwHFqrljzs1qHP3R3ME9e8dtzw)
#### Flashing XM125 (source: https://docs.sparkfun.com/SparkFun_Qwiic_Pulsed_Radar_Sensor_XM125/flashing_firmware_xm125/#flashing-firmware)
You will need to set the XM125 in bootloader mode.

- Press and hold the BOOT button.
- Press the RST button while still holding down the BOOT button.
- Release the RST button.
- After a short moment, release the BOOT button.

## model - HLK-LD2420
- some testing can be found at (https://fritzenlab.net/2025/01/04/hilink-ultrasonic-presence-sensor/)
- manual is available at (https://uelectronics.com/wp-content/uploads/2023/06/AR3645-LD2420-Sensor-de-Presencia-Humana-Datasheet.pdf?srsltid=AfmBOooTt_I4uQ0sFUNee2PMi0sGWq3HPKBJ8i6UkE_va0NRxrG-ETG3)
- Tools can be downloaded from (https://h.hlktech.com/Mobile/download/fdetail/225.html)

## SHIELD_AUTONOM_BGT60
- link (https://www.infineon.com/cms/en/product/evaluation-boards/shield_autonom_bgt60/)
- data sheet (https://www.infineon.com/dgdl/Infineon-AN608_BGT60LTR11AIP_Shield-ApplicationNotes-v01_80-EN.pdf?fileId=5546d4627550f4540175558b817a4d22)
- prince - 42.09 $

## BGT60LTR11AIP
- link (https://www.infineon.com/cms/en/product/sensor/radar-sensors/radar-sensors-for-iot/60ghz-radar/bgt60ltr11aip/)
- prince 10$
- Up to 7 m detection range for human targets
- https://uk.rs-online.com/web/p/rf-ics/2344631?cm_mmc=aff2-_-uk-_-octopart-_-2344631-_-instock&gad_source=7&dclid=CJiJ6KmviY0DFZWKrAIdVvsP5A
- detail datasheet at https://www.infineon.com/dgdl/Infineon-BGT60LTR11(S)AIP-DataSheet-v02_61-EN.pdf?fileId=8ac78c8c7c9758f2017cb7b72ee5268e

- Configuration for detecting approaching objects ( https://chat.deepseek.com/a/chat/s/434fda35-5dfe-42fa-a9db-a3713471fd56)

## IWR6843ABGABL
 - data sheet at (https://www.ti.com/document-viewer/IWR6843/datasheet)
 - price - 31 $

## BGT60TR13C
- https://www.infineon.com/cms/en/product/sensor/radar-sensors/radar-sensors-for-iot/60ghz-radar/bgt60tr13c/

## RCWL-0516
- https://www.youtube.com/watch?v=JOVd3sKEFaI&ab_channel=CrazyCoupleDIY
- https://lastminuteengineers.com/rcwl0516-microwave-radar-motion-sensor-arduino-tutorial/

## HB 100
- The HB100 (10.525 GHz Doppler radar) can detect speeds up to ~300 ft/s (91.4 m/s) under ideal conditions with practical speed of 100–200 ft/s (30–60 m/s)
- The following is the codes for Arduino using hardware interrupt; in ESP 32, from https://lastminuteengineers.com/handling-esp32-gpio-interrupts-tutorial/, it seems all digital GPIO pins support hardware interrupt.
- range 16 m
- can view its specs at (https://robokits.co.in/sensors/motion-detector/mh-et-live-hb100-10.525ghz-microwave-sensor-2-16-meters-doppler-radar-human-body-induction-switch-module-compatible-with-arduino?srsltid=AfmBOoogJ5RUyEGv-oVSxJNcL75mdsPriNfDPt84jdXlpQkv-ZGVWPRx)

```
#include <MsTimer2.h> // Timer interrupt function
Int ledOut = 13;
Int count=0;
Int pbln = 0; // Define the interrupt PIN is 0, that is, digital pins pins 2 Volatile int state = LOW; // Define ledOut, : default is of
Void setup()
{
Serial.begin(9600);
pinMode (ledOut, OUTPUT)
attachInterrupt(pbin, stateChange, FALLING); // Sets the interrupt function, // falling edge triggered interrupts.

MsTimer2::set(1000, process); // Set the timer interrupt time 1000ms
MsTimer2::start(); // Timer interrupt start
}
Void loop()
{
Serial.println(count); // Printing times of 1000ms suspension
Delay(1);
If(state == HIGH) // When moving objects are detected later, 2s shut down
// automatically after the ledout light is convenient.
{
Delay(2000);
State = LOW;
digitalWrite(ledOut, state); // Turn off led
}

}

Void stateChange() // Interrupt function
{
Count++; // I can add a function here when there is an interrupt.
}

Void process() //Timer handler
{

If(count>1) // 1000ms interrupt number greater than 1 is considereddetected a
// moving object (this value can be adjusted according to the actual
// situation, equivalent to adjust the detection threshold of the speed
// of a moving object)

State HIGH;
digitalWrite(ledOut, // Count zerale)://Lighting led
Count=0;
Else
}
```

- For ESP32, the interrupt will be as follow

```
  const uint8_t InterruptPin = 12;
bool Request;

void IRAM_ATTR isr() {
 Request = true;
}

void setup() {
 Serial.begin(9600);
 pinMode(InterruptPin, INPUT);
 attachInterrupt(InterruptPin, isr, RISING);
}

void loop() {
 if (Request){
   Serial.println("Interrupt Request Received!");
   Request = false;
 }
}
```

# Distance Sensor

- model - DTS6012M
- It supports both I2C and UART and I will choose to use UART for faster speed.
- And I found its UART baud rate to be: 921600 (it's its max rate, I think)
- Specifications at (https://www.polarisic.com/uploads/soft/20240412/1712905580.pdf)
- pin outs can be found at (https://www.paioutech.com/uploadfile/202403/ea1ff3f6934bae8.pdf)
- more complete specs in Chinese (https://www.paioutech.com/uploadfile/202406/104fa6ddcebbe93.pdf)
- https://github.com/acornelissen/DTS6012M_UART

### Pins connection
- I will use the 3.3 V pin from the ESP32 to power the sensor; I will need to use seperate power supply if required.


  ![image](https://github.com/user-attachments/assets/e39caa35-80b5-430c-9f15-8935aa86c0f2)

  ![image](https://github.com/user-attachments/assets/a8e454d0-c96d-40c8-ada3-52d6cebd27a8)

- The following is the translation by lens

 ![image](https://github.com/user-attachments/assets/408104b3-3d9e-4c46-9838-8b347b4740b1)

 ### Harware interface

 ![image](https://github.com/user-attachments/assets/e4d2d04c-b3a3-4dec-a31e-eee9496a2cbc)

 ### BMP388 
- https://www.bosch-sensortec.com/media/boschsensortec/downloads/datasheets/bst-bmp388-ds001.pdf
- 

 ![image](https://github.com/user-attachments/assets/29226cb3-2922-45e9-81cd-bc11285e6afd)

 ![image](https://github.com/user-attachments/assets/68f7249e-ed03-4d20-b243-b9b61d3a6c3d)

 ### Delay

 - https://www.youtube.com/watch?v=wgvo4aTATsU&ab_channel=TechStudyCell

