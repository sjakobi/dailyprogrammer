import fileinput

BITS_TO_XS = str.maketrans("01", " x")


def hex_to_xs(hex_string):
    bits = bin(int(hex_string, base=16))[2:]
    # replace '1's by 'x's, '0' by ' 's, and pad with spaces on the left
    return bits.translate(BITS_TO_XS).rjust(8)


def hexs_to_bitmap(hex_values):
    return "\n".join([hex_to_xs(h) for h in hex_values.split()])


if __name__ == '__main__':
    for line in fileinput.input():
        print(hexs_to_bitmap(line), end='\n\n')
