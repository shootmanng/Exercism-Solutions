function exchange_money(budget, exchange_rate)
    round(budget/exchange_rate,digits=2)
end

function get_change(budget, exchanging_value)
    budget - exchanging_value
end

function get_value_of_bills(denomination, number_of_bills)
    trunc(denomination * number_of_bills)
end

function get_number_of_bills(amount, denomination)
    floor(amount/denomination)
end

function get_leftover_of_bills(amount, denomination)
    amount - get_number_of_bills(amount, denomination) * denomination
end

function exchangeable_value(budget, exchange_rate, spread, denomination)
    get_number_of_bills(exchange_money(budget,exchange_rate + (spread/100) * exchange_rate),denomination) * denomination
end