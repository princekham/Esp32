- If dropped from 3000 ft, the speed at 30 ft above the ground would be 437 ft/s
- If from 1500 ft, the speed at 30 ft above the ground would be 308 ft/s
- processing speed required - <50ms

# Proximity Sensor

## XM125
- https://docs.sparkfun.com/SparkFun_Qwiic_Pulsed_Radar_Sensor_XM125/hardware_hookup/#connecting-a-usb-and-qwiic-cable
- https://docs.sparkfun.com/SparkFun_Qwiic_Pulsed_Radar_Sensor_XM125/assets/component_documentation/XM125_datasheet-3133248.pdf

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

# Distance Sensor

- model - DTS6012M
- It supports both I2C and UART and I will choose to use UART for faster speed.
- And I found its UART baud rate to be: 921600 (it's its max rate, I think)
- Specifications at (https://www.polarisic.com/uploads/soft/20240412/1712905580.pdf)
- pin outs can be found at (https://www.paioutech.com/uploadfile/202403/ea1ff3f6934bae8.pdf)
- more complete specs in Chinese (https://www.paioutech.com/uploadfile/202406/104fa6ddcebbe93.pdf)

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

