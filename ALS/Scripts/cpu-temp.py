# Script to show Raspberry Pi core Temperature
# To add it to alias only add cputemp='python3 "routeToFile"/cpu-temp.py' to the file .bash_aliases on your home folder
# StephanJ98

import os
import time

def get_temp():
	os.system("clear")
	temp = os.popen("cat /sys/class/thermal/thermal_zone0/temp").readline()
	temp = float(temp)
	return temp

while True:
	print("CPU Temp = " + str(get_temp()/1000) + " ºC")
	time.sleep(1)
