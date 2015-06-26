#Trouble Shooting Wifi

### Vocab

Router: 
 * Hardware device that routes data packets between networks. 
 * Generally also doubles as a wireless access point to connect to via wifi. 

LAN: 
 * Stands for Local Area Network.
 * The private network connected to the router.

WEP:
 * stands for Wired Equivalent Privacy.
 * extremely weak security standard.
 * essentially prevents accidental or uneducated unauthorized access, but anyone attempting to break in can.

WPA: 
 * stands for Wi-fi Protected Access.
 * a better security protocol.
 * current standard is WPA2.

SSID:
 * stands for Service Set Identifier.
 * it is a alphanumeric sequence of characters with a maximum length of 32 characters.
 * acts as the identifier for a WLAN (Wireless Local Area Network).
	* all wireless devices on a WLAN must use the same SSID to communicate with each other.
 * generally it is left blank and unspecified and a public SSID is used by default.
	* specifying a SSID may improve network security.

pass phrase: 
 * a phrase used as a password to access the security settings of the device.

Wifi frequency bands:
 * the frequency of the signal that wifi uses to transmit information.
 * either 2.4GHz or 5GHz.
 * 2.4GHz: 
 	* this frequency band is used by a huge number of devices (including your microewave oven) so there is a lot of interference, which makes it more difficult for data to be transmited between your access point and your computer. 
 	* it has a wider range than 5GHz. 
 	* it is slower than 5GHz.
 	* divided into 11 channels (in the USA)
 		* can only broadcast on 3 channels at a time
 * 5GHz: 
 	* few devices use it so there is much less interference.
 	* it has a reduced range, which further contributes to reducing interference.
 	* it is much faster the 2.4GHz.

frequency channels: 
	* each frequency has a range of channels they can utilize to broadcast data. 
	* channels overlap and thus cause interferance on each other. 
		* this means that the number of channels that can be transmitted on at once is determined by the distance MHz distance between channels and the total numbers of channels. 
	* 2.4GHz:
		* divided into 11 channels, numbered 1 through 11 that are roughly 5 MHz appart. 
		* generally channel 6 is the default channel used by most devices. 
		* channel 1 and 11 can be used without interferring with devices on channel 6 as their specific frequency is far enough apart (20 MHz). 
			* channel 1 = 2412 MHz
			* channel 6 = 2437 MHz 
			* channel 11 = 2462 MHz
	* 5GHz:
		* divided into many channels however only 8 are allowed to be used by the public, these available channels are roughly 20 MHz appart.
		* because they are 20 MHz appart, they can all be used without interferring with each other 
			* channel 36 = 5180 MHz
			* channel 40 = 5200 MHz
			* channel 44 = 5220 MHz
			* channel 48 = 5240 MHz
			* channel 149 = 5745 MHz
			* channel 153 = 5765 MHz
			* channel 157 = 5785 MHz
			* channel 161 = 5805 MHz
			* channel 165 = 5825 MHz


### Router automatic setup won't detect the router 
 * Connect an Ethernet cable from your computer to one of the LAN ports on the router.
 * Go to your computers network settings -> look for something along the lines of Change Adapter Settings
 * Look for Local Area Connection and select Properties
 * Then change the IP address being used to one that is almost identical to the one marked in the routers documentation
 	* if the router's IP is "192.168.1.1" change the IP address in properties to "192.168.1.2"
 * Under Subnet mask enter "255.255.255.0" (this is a home network default)
 * Under Gateway enter the IP of the router which in this example is "192.168.1.1"
 * Type the router IP in the address bar of the Browser 
 	* you will be prompted for a Username and Password, they should be in the router documentation 
 	* once cleared you should be able to manually setup your wireless connection including: 
 		* SSID:
 			* stands for Service Set Identifier.
 			* it is a alphanumeric sequence of characters with a maximum length of 32 characters 
 			* acts as the identifier for a WLAN (Wireless Local Area Network)
 				* all wireless devices on a WLAN must use the same SSID to communicate with each other 	
 			* generally it is left blank and unspecified and a public SSID is used by default 
 				* specifying a SSID may improve network security 
 		* pass phrase: 
 			* a phrase used as a password to access the security settings of the device 
 		* security: 
 			* a protocol in place to prevent unauthorized access to computers on a wireless network 
 			* two most used protocol are WEP and WPA
 			* WEP:
 				* stands for Wired Equivalent Privacy 
 				* extremely weak security standard 
 				* essentially prevents accidental or uneducated unauthorized access, but anyone attempting to break in can
 			* WPA: 
 				* stands for Wi-fi Protected Access
 				* a better security protocol 
 				* current standard is WPA2 

### Wireless network's name/SSID was listed but now has disappeared.
 * go computer network settings -> look for manage wireless networks 
 * if you see your wireless network listed
 	* find it's properties 
 	* connect even if network is not broadcasting its name (SSID)
 * if you don't see your wireless network listed 
	* add it in manually by entering your wireless information in 









### Diagnostic :: MAC 



