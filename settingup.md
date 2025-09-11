

# Setting Up

References
- https://www.youtube.com/watch?v=BNzeVGD8IZI&ab_channel=AlexFache
- 

### Frame Model
- G630 (https://store.effort-tech.com/products/fully-automatic-operation-g630-agriculture-drone-frame-kit-include-8l-brushless-water-pump-and-rtk-fixing-parts-component?VariantsId=10826)
- More Specs at (https://www.effort-tech.com/en/gxs)

- Airframe Type 
  
  ![image](https://github.com/user-attachments/assets/9e5ba677-e3b4-40b3-a71f-298a574a9fff)

  ![image](https://github.com/user-attachments/assets/5d48cfe6-f391-4fe4-9ddf-1855835b31c1)

  (image source: https://docs.px4.io/main/en/airframes/airframe_reference.html)


- Battery type - Rechargable Lithium-ion Battery, 22000 mah, 1170.4 Wh, norminal voltage 53.2 V, charging limit voltage 60.9 V,
- Power Supply Module for 14S battery - PM06D (must include D - PM06D - 14S)
- Because high power PM02D is used, I need to enable SENS_EN_INA228 (and disable SENS_EN_INA226) (source: https://www.bzbuas.com/shop/15011-pm02d-12s-power-module-497)
- Motor - X9 plus, 13kg per axis
    - yellow, red, green wire
    - black and white wire
    - I will use the PWM control instead of CAN ports
 
      ![image](https://github.com/user-attachments/assets/f6ce3077-69f0-46f7-941e-14dcc1554345)

- for stepping down, recommended by AI for stepping down - LM2596HV

## For setting up the motors
  - Calibration for PWM maxium for ESC can be done under 'Power' 

  ![image](https://github.com/user-attachments/assets/348bc6e1-c481-4d36-bf05-5d00e99a7955)

## For Row, Pitch, Yaw Adjustment
- You can turn of autotune and reduce the gain for both attitude and rates for all three

  ![image](https://github.com/user-attachments/assets/0c79b810-7e92-4fd3-acab-751d66ef58ca)


## Radio Control
     - Skydroid H30 (page: https://www.worldronemarket.com/skydroid-h30-r30/)
     - password : 999 (source: https://www.youtube.com/watch?v=IAyYyI09_TQ&ab_channel=WorldDroneMarket)
     - the range of H30 controller is found to be 30 km ( source: https://www.foxtechfpv.com/h30-30km-gcs.html#:~:text=H30%20is%20a%20portable%20ground,rc%20transmission%20range%20is%2030km.)
     - specifications at (https://www.worldronemarket.com/skydroid-h30-r30/)
  - Setting up for Rado Channel (source: https://www.youtube.com/watch?v=A7JpgpJadKM&ab_channel=AlexFache)
  - In H12 Pro, the receiver Baud rate used is 57600 (source: https://www.youtube.com/watch?v=LMz7lrE9wDA&ab_channel=WorldDroneMarket)
  - The Qgroundcontrol for android can be downloaded from https://docs.qgroundcontrol.com/master/en/qgc-user-guide/getting_started/download_and_install.html
  - There are 32 bits and 64 bits versions for android and it is said 32 bits is for older android versions.
  - I found that 'FLY GCS' app can also be used along with Qgroundcontrol. It is said it is more user-friendly. (source 6:40 : https://www.youtube.com/watch?v=LMz7lrE9wDA&ab_channel=WorldDroneMarket)
  - The following is the comparison between the two by DeepSeek

    ![image](https://github.com/user-attachments/assets/df20d25c-b638-4125-afa4-c2dd0b30593a)

  - And we can set up the signal alert from the 'Fly GCS' (see 7:21: https://www.youtube.com/watch?v=LMz7lrE9wDA&ab_channel=WorldDroneMarket)




      ![image](https://github.com/user-attachments/assets/e81bfe4a-72bd-46cb-9bcb-4b199ca7f90d)

     - Channel 1 : engine throttle
     - Channel 2 : Yaw
     - Channel 3 : Pitch
     - Channel 4 : Roll
     - Channel 5 : Fmode
     - Channel 6 : Arm

### Radio Channels Setup 
- H30 Rado controller has different channels for row, pitch, yaw, throttle. The following is my setup for it.
- Channel 1 - Roll (ဘယ်သွား ညာသွား) 
- Chaannel 2 - Pitch (ရှေ့သွား နောက်ဆုတ်)
- Channel 3 - Engine Throttle (အင်ဂျင်အား အတင်အချ)
- Channel 4 - Yaw (ဘယ်ညာ လှည့်တာ)
- Channel 5 - 
- Channel 6 - 


   
  - Roll, Pitch, Yaw Channel setup can be seen at 'Parameters' by filtering 'rc_map'
 
    ![image](https://github.com/user-attachments/assets/9038cf8d-8943-4910-b3ce-b2510ee4543f)

 - The following is the standard control assignment to a radio controller (source: https://docs.px4.io/v1.11/en/flying/basic_flying.html)

   ![image](https://github.com/user-attachments/assets/5089db27-4990-4216-9d2a-31675b065e6f)
## Qgroundcontrol settings
- UDP, port 14450, 192.168.144.101

## Flight Modes Setup
- The following is from https://www.youtube.com/watch?v=A7JpgpJadKM&ab_channel=AlexFache

  ![image](https://github.com/user-attachments/assets/10360e60-693d-4d7c-9170-02784cc3015f)



- It seems that most setup three modes: Hold, Altitude and Position

  
  ![image](https://github.com/user-attachments/assets/ff0e692a-3bf6-401e-8bda-8064145b132d)
 
- Stabalize mode : Provides basic stabilization and allows the pilot to control the vehicle's orientation.
- Altitute Hold : Maintains a constant altitude while allowing for manual control of pitch and roll.
- Position Control : Uses GPS to maintain the vehicle's position and allows for manual control of pitch and yaw.

- 'Emergency Kill Switch' s a safety feature that allows for immediate and forceful disarming of the motors in an emergency. It's a mechanism to stop the vehicle's motors in situations where software malfunctions, loss of control, or other critical issues arise. 
  
## Camera settings

  - C12 Dual Light Gimbal (https://www.worldronemarket.com/skydroid-c12-user-manual/)
  - rtsp://192.168.144.108:554/stream=0 (source: https://www.youtube.com/watch?v=M4pU3FTgW3M&ab_channel=WorldDroneMarket)
  - Three wires are connected
  - S Bus + power cable for the radio hub
  - Lan + Power supply
  - Transmission cable
  - For IP setting, see below (source: https://www.youtube.com/watch?v=L_87hoQ0i18&ab_channel=WorldDroneMarket)
     
![image](https://github.com/user-attachments/assets/7d839c55-0c9c-4ada-a6b0-653e3b2169bf)

 - Connection Diagram provided by the technician

![image](https://github.com/user-attachments/assets/11df2c82-f61b-4898-b7d1-bae6ab0cf45a)

        
![image](https://github.com/user-attachments/assets/789c0db4-c0cf-4baa-b0a7-19ecbcdeaf56)

### Ethernet port

![image](https://github.com/user-attachments/assets/6b527ff1-41a1-482d-9e3e-03c833bff99a)

### For Debugging
- I am going to set computer network ethernet port IP to be 192.168.144.*

## servo motor (source: https://www.aliexpress.com/item/1005007384750005.html)
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

    ### Servo motor channel setup
    - RC_MAP_AUX1 : channel 
    - RC_MAP_AUX2 : channel
    - RC_MAP_AUX3 : channel
    - RC_MAP_AUX4 : channel
    - RC_MAP_AUX5 : channel
    - RC_MAP_AUX6 : channel 

### Wire Connection
- Power wire : Red
- Ground wire : Black or Brown
- Signal Wire : Often Orange or Yellow

## Battery Specifications: (source: https://genstattu.com/tattu-plus-3-0-22000mah-51-8v-25c-14s1p-lipo-smart-battery-pack-with-molex-plug/)

- Minimum Capacity: 22000mAh
- Configuration: 14S1P / 51.8V / 14Cells
- Discharge Rate: 25C
- Net Weight(±20g): 8800g
- Dimensions: 279mm Length x 236mm Width x 91mm Height
- Charge Plug: Molex-43045-1600
- Discharge Plug: Molex-46562-2657

How to calculate battery voltage

- Nominal Voltage:
   - The nominal voltage of a 12S battery is 44.4V, calculated as 12 cells multiplied by the nominal voltage of each cell (3.7V). 
- Maximum Voltage:
   - When fully charged, each cell in a 12S battery can reach 4.2V, resulting in a maximum voltage of 50.4V (12 cells x 4.2V). 

## Arm Switch 
 - It says it should be on the left (source at 4:00 : https://www.youtube.com/watch?v=xQkusMZzug0&ab_channel=DroneBlocks )
## Landing
 - For setting landing altitute 'mpc_land_alt1', 'mpc_land_alt2' and 'mpc_land_alt3'
 - For landing decent rate 'mpc_land_speed'
 - For max decent and ascent rate 'MPC_Z_VEL_MAX_DN' 'MPC_Z_VEL_MAX_UP'
 - For max decent and ascent rate in autonomous mode ' MPC_Z_V_AUTO_DN' MPC_Z_V_AUTO_UP
 - 
## GPS F9P
- The U-blox F9P is a multi-band, high-precision GNSS receiver that supports concurrent reception of
-  GPS,
-  GLONASS,
-  Galileo, and
-  BeiDou constellations on L1 and L5 bands, providing < 0.01m accuracy with RTK.
### Dual GPS setup 
- controlled by SENS_GPS_MASK parameter. (it allows, for example, a standard GPS to be used as a backup to a more accurate RTK receiver).
- The SENS_GPS_MASK parameter is set by default to disable blending and always use the first receiver,
- Where different receiver models are used, it is important that the SENS_GPS_MASK parameter is set to a value that uses accuracy metrics that are supported by both receivers. (what is accuracy metrics?)
- The GPS_2_CONFIG parameter will need to be set correctly.
- Check the s_variance_m_s, eph and epv data from each receiver and decide which accuracy metrics can be used.
- s_variance_m_s
- epv
- eph
- Bit position 2 would only be set if the GPS had been selected as the reference height source with the EKF2_HGT_REF parameter and both receivers output sensible epv data.
- The output from the blended receiver data is logged as ekf_gps_position, and can be checked whilst connect via the nsh terminal using the command listener ekf_gps_position.
- 
