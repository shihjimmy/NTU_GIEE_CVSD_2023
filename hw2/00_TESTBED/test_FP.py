import bitstring, random 

def ieee754():
    # Ensure that the generated number is normalized
    exponent = random.randint(1, 254)
    fraction = random.randint(0, (1 << 23) - 1)
    sign = random.randint(0,1)
    # Construct the 32-bit binary representation in IEEE 754 format
    b = bitstring.BitArray(bin=f'{sign:01b}{exponent:08b}{fraction:023b}')
    return b

def generate_non_denormalized_mult():
    a = ieee754()
    b = ieee754()
    ab = bitstring.BitArray(float=a.float * b.float, length=32)
    
    # Check if ab is denormalized; if so, regenerate
    # Extract the 8 bits representing the exponent
    a_exponent_bits = a[1:9]
    b_exponent_bits = b[1:9]
    ab_exponent_bits = ab[1:9]
    
    check = (ab_exponent_bits == bitstring.BitArray('0x00')) or ab_exponent_bits == bitstring.BitArray('0xff') or a_exponent_bits == bitstring.BitArray('0x00') or a_exponent_bits == bitstring.BitArray('0xff') or b_exponent_bits == bitstring.BitArray('0x00') or b_exponent_bits == bitstring.BitArray('0xff')
    
    while check:
        a = ieee754()
        b = ieee754()
        ab = bitstring.BitArray(float=a.float * b.float, length=32)
        
        a_exponent_bits = a[1:9]
        b_exponent_bits = b[1:9]
        ab_exponent_bits = ab[1:9]
        check = (ab_exponent_bits == bitstring.BitArray('0x00')) or ab_exponent_bits == bitstring.BitArray('0xff') or a_exponent_bits == bitstring.BitArray('0x00') or a_exponent_bits == bitstring.BitArray('0xff') or b_exponent_bits == bitstring.BitArray('0x00') or b_exponent_bits == bitstring.BitArray('0xff')
        
    return a, b, ab

def generate_non_denormalized_add():
    a = ieee754()
    b = ieee754()
    ab = bitstring.BitArray(float=a.float + b.float, length=32)
    
    # Check if ab is denormalized; if so, regenerate
    a_exponent_bits = a[1:9]
    b_exponent_bits = b[1:9]
    ab_exponent_bits = ab[1:9]
    
    while ab_exponent_bits == bitstring.BitArray('0x00') or ab_exponent_bits == bitstring.BitArray('0xff') or a_exponent_bits == bitstring.BitArray('0x00') or a_exponent_bits == bitstring.BitArray('0xff') or b_exponent_bits == bitstring.BitArray('0x00') or b_exponent_bits == bitstring.BitArray('0xff'):
        a = ieee754()
        b = ieee754()
        ab = bitstring.BitArray(float=a.float + b.float, length=32)
        
        a_exponent_bits = a[1:9]
        b_exponent_bits = b[1:9]
        ab_exponent_bits = ab[1:9]

    return a, b, ab

def generate_non_denormalized_sub():
    a = ieee754()
    b = ieee754()
    ab = bitstring.BitArray(float=a.float - b.float, length=32)
    
    # Check if ab is denormalized; if so, regenerate
    a_exponent_bits = a[1:9]
    b_exponent_bits = b[1:9]
    ab_exponent_bits = ab[1:9]
    
    while ab_exponent_bits == bitstring.BitArray('0x00') or ab_exponent_bits == bitstring.BitArray('0xff') or a_exponent_bits == bitstring.BitArray('0x00') or a_exponent_bits == bitstring.BitArray('0xff') or b_exponent_bits == bitstring.BitArray('0x00') or b_exponent_bits == bitstring.BitArray('0xff'):
        a = ieee754()
        b = ieee754()
        ab = bitstring.BitArray(float=a.float - b.float, length=32)
        
        a_exponent_bits = a[1:9]
        b_exponent_bits = b[1:9]
        ab_exponent_bits = ab[1:9]

    return a, b, ab

# Python's default rounding rule is round to the nearest even
iteration = 1000
with open("testMultiply.dat", "w") as f:
    for i in range(iteration):
        a, b ,ab = generate_non_denormalized_mult()
        f.write(a.hex + b.hex + ab.hex + "\n")
        
with open("testAddition.dat", "w") as f:
    for i in range(iteration):
        a, b ,ab = generate_non_denormalized_add()
        f.write(a.hex + b.hex + ab.hex + "\n")
        
with open("testSubtraction.dat", "w") as f:
    for i in range(iteration):
        a, b ,ab = generate_non_denormalized_sub()
        f.write(a.hex + b.hex + ab.hex + "\n")

