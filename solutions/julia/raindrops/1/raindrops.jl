function raindrops(number)
    result = ""
    
    if number % 3 == 0
        result = "Pling"
    end

    if number % 5 == 0
        result = result * "Plang"
    end

    if number % 7 == 0
        result = result * "Plong"
    end

    if result == ""
        return string(number)
    end

    result
    
end
