import os

size = os.path.getsize("lab2.bin")

small = open("lab2.bin", "rb")
big = open("lab2.img", "wb")
big.write(small.read())
bytes = b'\x00' * (1474560 - size)
big.write(bytes)