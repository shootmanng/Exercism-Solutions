function success_rate(speed)
    if speed == 0
        return 0
    elseif speed < 5 && speed > 0
        return 1.0
    elseif speed < 9 && speed > 4
        return 0.90
    elseif speed == 9
        return 0.80
    elseif speed == 10 
        return 0.77
    else
        return "wtf thats not a valid number."
    end
end

function production_rate_per_hour(speed)
    speed * 221 * success_rate(speed)
end

function working_items_per_minute(speed)
    div(Int(trunc(production_rate_per_hour(speed))), 60)
end
