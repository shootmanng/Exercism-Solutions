def color():
    return [
            "black",
            "brown",
            "red",
            "orange",
            "yellow",
            "green",
            "blue",
            "violet",
            "grey",
            "white"
            ]
    
def resistor_label(colors):
    tol = {
        "grey" : "0.05%",
        "violet" : "0.1%",
        "blue" : "0.25%",
        "green" : "0.5%",
        "brown" : "1%",
        "red" : "2%",
        "gold" : "5%",
        "silver" : "10%"
    }
    if len(colors) == 1:
        return str(color().index(colors[0])) + " ohms"
    if len(colors) == 4:
        result = int(str(color().index(colors[0]) * 10 + color().index(colors[1])) + '0' * color().index(colors[2]))
        if result < 1000:
            return str(result) + " ohms ±" + tol[colors[3]]
        if 1000 <= result < 1000000:
            return str(result//1000) + " kiloohms ±" + tol[colors[3]] if result % 1000 == 0 else str(result/1000) + " kiloohms ±" + tol[colors[3]]
        if 1000000 <= result < 1000000000:
            return str(result//1000000) + " megaohms ±" + tol[colors[3]] if result % 1000000 == 0 else str(result/1000000) + " kiloohms ±" + tol[colors[3]]
        else:
            return str(result/1000000000) + " gigaohms ±" + tol[colors[3]]
            
    if len(colors) == 5:
        result = int(str(color().index(colors[0]) * 100 + color().index(colors[1]) * 10 + color().index(colors[2])) + '0' * color().index(colors[3]))
        
        if result < 1000:
            return str(result) + " ohms ±" + tol[colors[4]]
        if 1000 <= result < 1000000:
            return str(result//1000) + " kiloohms ±" + tol[colors[4]] if result % 1000 == 0 else str(result/1000) + " kiloohms ±" + tol[colors[4]]
        if 1000000 <= result < 1000000000:
            return str(result//1000000) + " megaohms ±" + tol[colors[4]] if result % 1000000 == 0 else str(result/1000000) + " megaohms ±" + tol[colors[4]]
        else:
            return str(result/1000000000) + " gigaohms ±" + tol[colors[4]]

