import os
import time

while True:
	try:
		fd=open("/home/pi/carpc/.carpc_trigger_update","r")
		line=fd.readline()
		fd.close()
		if int(line) == 1:
			print "Update needed"
			os.system("SKIP_KERNEL=0 SKIP_XBMC=0 SKIP_XBMC_ADDONS=0 SKIP_NAVIT=0 SKIP_LOADING_VIDEO=0 SKIP_STARTUP=0 SKIP_SOURCES=0 SKIP_UNPACK=0 ./rpi-carpc.sh update")
			os.system("echo 0 > /home/pi/carpc/.carpc_trigger_update")
	except:
		VERSION=1
	time.sleep(1)

