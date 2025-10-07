-- This program adds reset button (RC channel 9) to the program

local MAV_SEVERITY_DEBUG = 7
local trigger_locked = false
local current_servo_index = 1  -- Track which servo to trigger next
local servo_channels = {8, 9, 10, 11, 12, 13}  -- Servo channels

function pulse_servo(servo_channel)
    SRV_Channels:set_output_pwm_chan(servo_channel, 2000)
    gcs:send_text(MAV_SEVERITY_DEBUG, "Servo " .. servo_channel .. " PULSE START")
    
    return function()
        SRV_Channels:set_output_pwm_chan(servo_channel, 1300)
        gcs:send_text(MAV_SEVERITY_DEBUG, "Servo " .. servo_channel .. " PULSE END")
        
        -- Move to next servo in sequence
        current_servo_index = current_servo_index + 1
        
        -- If we've pulsed all servos, restart from first
        if current_servo_index > #servo_channels then
            current_servo_index = 1
            gcs:send_text(MAV_SEVERITY_DEBUG, "Sequence complete - reset to servo " .. servo_channels[1])
        end
        
        -- Return to monitoring
        return monitor_and_trigger, 1000
    end, 2000
end

function check_reset_button()
    local reset_value = rc:get_pwm(9)  -- Using channel 9 as reset button
    
    if reset_value and reset_value >= 2000 then
        current_servo_index = 1
        gcs:send_text(MAV_SEVERITY_DEBUG, "Reset button pressed - servo sequence reset to " .. servo_channels[1])
        return true
    end
    
    return false
end

function monitor_and_trigger()
    -- Check reset button first
    if check_reset_button() then
        return monitor_and_trigger, 300
    end
    
    local trigger_value = rc:get_pwm(8)  -- Using channel 8 as trigger
    
    if trigger_value then
        -- Reset lock when trigger goes low
        if trigger_locked and trigger_value <= 1000 then
            trigger_locked = false
            gcs:send_text(MAV_SEVERITY_DEBUG, "Trigger reset - ready for next pulse")
        end
        
        -- Only trigger if unlocked AND above threshold
        if not trigger_locked and trigger_value > 1800 then
            local next_servo = servo_channels[current_servo_index]
            gcs:send_text(MAV_SEVERITY_DEBUG, "Trigger detected, pulsing servo " .. next_servo .. " (" .. current_servo_index .. "/6)")
            trigger_locked = true
            return pulse_servo(next_servo), 100
        end
    end
    
    return monitor_and_trigger, 300
end

-- Start the monitor
return monitor_and_trigger, 1000
