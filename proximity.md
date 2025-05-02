# Proximity Sensor

- model - HLK-LD2420
- some testing can be found at (https://fritzenlab.net/2025/01/04/hilink-ultrasonic-presence-sensor/)
- manual is available at (https://uelectronics.com/wp-content/uploads/2023/06/AR3645-LD2420-Sensor-de-Presencia-Humana-Datasheet.pdf?srsltid=AfmBOooTt_I4uQ0sFUNee2PMi0sGWq3HPKBJ8i6UkE_va0NRxrG-ETG3)
- Tools can be downloaded from (https://h.hlktech.com/Mobile/download/fdetail/225.html)


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

 ![image](https://github.com/user-attachments/assets/29226cb3-2922-45e9-81cd-bc11285e6afd)

 ![image](https://github.com/user-attachments/assets/68f7249e-ed03-4d20-b243-b9b61d3a6c3d)

