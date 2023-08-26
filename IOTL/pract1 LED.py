import RPi.GPIO as io
import time

io.setmode(io.BOARD)
# io.setmode(io.BMC)

keys = [39, 3]

for key in keys:
    io.set(key,io.OUT)


for key in keys:
    io.output(key,True)
    time.sleep(2)
    io.output(key,False)
    time.sleep(2)
    
io.cleanup()
