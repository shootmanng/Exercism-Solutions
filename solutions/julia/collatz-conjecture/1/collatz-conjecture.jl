function collatz_steps(num)
    if num <= 0
        throw(DomainError(num,"Must be a positive integer"))
    end

    steps = 0
    while num != 1
        if num % 2 == 0
            steps +=1
            num /= 2
        else
            steps +=1
            num = 3*num + 1 
        end
    end

    return steps
end