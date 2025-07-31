function score(x, y)
    
    dist = x^2 + y^2
    
    if dist > 100
        result = 0
    end

    if (dist > 25) && (dist <= 100)
        result = 1
    end

    if (dist > 1) && (dist <= 25)
        result = 5
    end

    if dist <= 1
        result = 10
    end

    result
    
end
