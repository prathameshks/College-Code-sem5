# Raspberry Pi IR Sensor turn on light when motion is detected

import RPi.GPIO as GPIO
import time
GPIO.setmode(GPIO.BOARD)
GPIO.setup(3,GPIO.IN)
GPIO.setup(5,GPIO.OUT)

while True:
    val = GPIO.input(3)
    print(val)
    if val == 1: # noting is detected
        GPIO.output(5,False)
    else:
        GPIO.output(5,True)


