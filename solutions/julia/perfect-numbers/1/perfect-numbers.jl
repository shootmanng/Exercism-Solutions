function isperfect(x)
    if x < 1
        throw(DomainError(x, "x must be positive"))
    end
    sum = 0
    for i in 1:(x - 1)
        if x % i == 0
            sum += i
        end
    end
    sum == x
end

function isabundant(x)
    if x < 1
        throw(DomainError(x, "x must be positive"))
    end
    sum = 0
    for i in 1:(x - 1)
        if x % i == 0
            sum += i
        end
    end
    sum > x
end

function isdeficient(x)
    if x < 1
        throw(DomainError(x, "x must be positive"))
    end
    sum = 0
    for i in 1:(x - 1)
        if x % i == 0
            sum += i
        end
    end
    sum < x
end