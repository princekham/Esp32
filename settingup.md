![image](https://github.com/user-attachments/assets/c205e1eb-6560-43f6-a892-9c54dad111ad)

# Setting Up
- Airframe Type 
  
  ![image](https://github.com/user-attachments/assets/9e5ba677-e3b4-40b3-a71f-298a574a9fff)

  ![image](https://github.com/user-attachments/assets/5d48cfe6-f391-4fe4-9ddf-1855835b31c1)

  (image source: https://docs.px4.io/main/en/airframes/airframe_reference.html)


- Battery type - Rechargable Lithium-ion Battery, 22000 mah, 1170.4 Wh, norminal voltage 53.2 V, charging limit voltage 60.9 V,
- Power Supply Module for 14S battery - PM06D (must include D - PM06D - 14S)

- Motor - X9 plus, 13kg per axis
    - yellow, red, green wire
    - black and white wire
    - I will use the PWM control instead of CAN ports
 
      ![image](https://github.com/user-attachments/assets/f6ce3077-69f0-46f7-941e-14dcc1554345)

- for stepping down, recommended by AI for stepping down - LM2596HV

- For setting up the motors

  ![image](https://github.com/user-attachments/assets/348bc6e1-c481-4d36-bf05-5d00e99a7955)

- Radio Control
     - Skydroid H30
     - password : 999 (source: https://www.youtube.com/watch?v=IAyYyI09_TQ&ab_channel=WorldDroneMarket)
  - Setting up for Rado Channel (source: https://www.youtube.com/watch?v=A7JpgpJadKM&ab_channel=AlexFache)

      ![image](https://github.com/user-attachments/assets/e81bfe4a-72bd-46cb-9bcb-4b199ca7f90d)

     - Channel 1 : engine throttle
     - Channel 2 : Yaw
     - Channel 3 : Pitch
     - Channel 4 : Roll
     - Channel 5 : Fmode
     - Channel 6 : Arm
   
  - Roll, Pitch, Yaw Channel setup can be seen at 'Parameters' by filtering 'rc_map'
 
    ![image](https://github.com/user-attachments/assets/9038cf8d-8943-4910-b3ce-b2510ee4543f)

 - The following is the standard control assignment to a radio controller (source: https://docs.px4.io/v1.11/en/flying/basic_flying.html)

   ![image](https://github.com/user-attachments/assets/5089db27-4990-4216-9d2a-31675b065e6f)


- Flight Modes Setup
- The following is from https://www.youtube.com/watch?v=A7JpgpJadKM&ab_channel=AlexFache

  ![image](https://github.com/user-attachments/assets/10360e60-693d-4d7c-9170-02784cc3015f)


- camera settings
    - C12 Dual Light Gimbal
    - rtsp://192.168.144.108:554/stream=0 (source: https://www.youtube.com/watch?v=M4pU3FTgW3M&ab_channel=WorldDroneMarket)
    - Three wires are connected
      - S Bus + power cable for the radio hub
      - Lan + Power supply
      - Transmission cable
      - For IP setting, see below (source: https://www.youtube.com/watch?v=L_87hoQ0i18&ab_channel=WorldDroneMarket)
     
        ![image](https://github.com/user-attachments/assets/7d839c55-0c9c-4ada-a6b0-653e3b2169bf)

- servo motor (source: https://www.aliexpress.com/item/1005007384750005.html)
   - Operating Voltage: 4.8 ~ 6.8 DC Volts
   - Dead brand: 3mus
   - Weight: 60 g (2.12 oz)
   - Motor Type: DC Motor
   - Gear Type: Copper & Aluminum
   - Working frequence: 50-333Hz
   - Operating travel:180deg（PWM 500-2500mus）
   - Size: 40 x 20 x 40.5 mm ( 1.58 x 0.79 x 1.60 in)
   - it consumes around 5A each
   - Options
      - Hobbywing UBEC 10 A (source: https://www.3dxr.co.uk/electronics-c78/power-management-c91/voltage-regulators-becs-c101/hobbywing-10a-ubec-hv-3-14s-v1-p5805)
  - He used the stick to control the servo (https://www.youtube.com/watch?v=A7JpgpJadKM&ab_channel=AlexFache)

How to calculate battery voltage

- Nominal Voltage:
   - The nominal voltage of a 12S battery is 44.4V, calculated as 12 cells multiplied by the nominal voltage of each cell (3.7V). 
- Maximum Voltage:
   - When fully charged, each cell in a 12S battery can reach 4.2V, resulting in a maximum voltage of 50.4V (12 cells x 4.2V). 
