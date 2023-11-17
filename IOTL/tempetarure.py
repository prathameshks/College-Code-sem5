# Raspberry pi turn on led when temperature is above 30 degree

import Adafruit_DHT
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BOARD)
GPIO.setup(3,GPIO.OUT)
GPIO.setup(5,GPIO.OUT)

while True:
    humidity, temperature = Adafruit_DHT.read_retry(Adafruit_DHT.DHT11, 4)
    print(temperature)
    if temperature > 30:
        GPIO.output(3,True)
    else:
        GPIO.output(3,False)
        