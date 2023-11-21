# Raspberry pi water sensor turn on light when water is detected

import RPi.GPIO as GPIO
import time
GPIO.setmode(GPIO.BOARD)
GPIO.setup(3,GPIO.IN)
GPIO.setup(5,GPIO.OUT)

while True:
    val = GPIO.input(3)
    print(val)
    if val == 0: # noting is detected
        GPIO.output(5,False)
    else:
        GPIO.output(5,True)
    time.sleep(1)