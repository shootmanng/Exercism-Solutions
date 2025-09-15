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
    
def label(colors):
    result = int(str(color().index(colors[0]) * 10 + color().index(colors[1])) + '0' * color().index(colors[2]))
    if result < 1000:
        return str(result) + " ohms"
    if 1000 <= result < 1000000:
        return str(result//1000) + " kiloohms"
    if 1000000 <= result < 1000000000:
        return str(result//1000000) + " megaohms"
    else:
        return str(result//1000000000) + " gigaohms"