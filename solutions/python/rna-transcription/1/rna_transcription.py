def to_rna(dna_strand):
    comp = {
        "G" : "C",
        "C" : "G",
        "T" : "A",
        "A" : "U"
    }

    return dna_strand.translate(str.maketrans(comp))