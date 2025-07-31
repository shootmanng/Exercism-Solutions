function raindrops(number)
    result = ""
    
    if number % 3 == 0
        result = "Pling"
    end

    if number % 5 == 0
        result *= "Plang"
    end

    if number % 7 == 0
        result *= "Plong"
    end

    if result == ""
        result = string(number)
    end

    result
    
end
