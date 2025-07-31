function score(x, y)
    
    if x^2 + y^2 > 100
        result = 0
    end

    if (x^2 + y^2 > 25) && (x^2 + y^2 <= 100)
        result = 1
    end

    if (x^2 + y^2 > 1) && (x^2 + y^2 <= 25)
        result = 5
    end

    if x^2 + y^2 <= 1
        result = 10
    end

    result
    
end
