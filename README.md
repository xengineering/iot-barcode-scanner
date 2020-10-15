

# IoT Barcode Scanner

A service that makes barcode scanners available on the network for IoT use.


## Usage

1. Adapt config.json file if needed.
2. Run ```sudo python barcode_scanner_daemon.py```
3. Run ```python barcode_transmit_daemon.py```
4. Listen to MQTT output (e.g. with ```mosquitto_sub -h localhost -t "xengineering.eu/iot-barcode-scanner"```)


## Milestones

- [x] MVP: Forward keyboard/scanner input to MQTT topic
- [x] Use config file
- [x] Disable scanner as regular input source and bind it only to the service
- [x] Split into two executables to reduce root-priviledged code
- [ ] Implement systemd services
- [ ] Write Makefile for easy installation
- [ ] Implement auto discovery of barcode scanners
- [ ] Package it for Arch Linux


## Dependencies

- ```python-paho-mqtt```
- ```python-evdev```


## Links

- [python-evdev documentation](https://python-evdev.readthedocs.io/en/latest/index.html)
- [Please answer this guy!](https://stackoverflow.com/questions/49850238/redirect-usb-hid-barcode-output-to-dev-tty-device)
