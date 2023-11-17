# capture image from camera and save it to local storage

import RPi.GPIO as GPIO
import time
from picamera import PiCamera

GPIO.setmode(GPIO.BOARD)

camera = PiCamera()

camera.start_preview()
time.sleep(5)
camera.capture('/home/pi/Desktop/image.jpg')
camera.stop_preview()

GPIO.cleanup()

# record video from camera and save it to local storage

import RPi.GPIO as GPIO
import time
from picamera import PiCamera

GPIO.setmode(GPIO.BOARD)

camera = PiCamera()

camera.start_preview()
camera.start_recording('/home/pi/Desktop/video.h264')
time.sleep(10)
camera.stop_recording()
camera.stop_preview()

GPIO.cleanup()
