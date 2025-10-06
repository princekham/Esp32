local MAV_SEVERITY_DEBUG = 7
local trigger_locked = false  -- Track trigger state

function pulse_servo(servo_channel)
    SRV_Channels:set_output_pwm_chan(servo_channel, 2000)
    gcs:send_text(MAV_SEVERITY_DEBUG, "Servo " .. servo_channel .. " PULSE START")
    
    return function()
        SRV_Channels:set_output_pwm_chan(servo_channel, 1300)
        gcs:send_text(MAV_SEVERITY_DEBUG, "Servo " .. servo_channel .. " PULSE END")
        
        -- Restart monitoring
        return monitor_and_trigger, 1000
    end, 2000
end

function monitor_and_trigger()
    local trigger_value = rc:get_pwm(8)
    
    if trigger_value then
        -- Reset lock when trigger goes low
        if trigger_locked and trigger_value <= 1000 then
            trigger_locked = false
            gcs:send_text(MAV_SEVERITY_DEBUG, "Trigger reset - ready for next pulse")
        end
        
        -- Only trigger if unlocked AND above threshold
        if not trigger_locked and trigger_value > 1800 then
            gcs:send_text(MAV_SEVERITY_DEBUG, "Trigger detected, pulsing servo")
            trigger_locked = true  -- Lock the trigger
            return pulse_servo(1), 100
        end
    end
    
    return monitor_and_trigger, 300  -- Continue monitoring
end

-- Start the monitor
return monitor_and_trigger, 1000
