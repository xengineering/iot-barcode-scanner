

# IoT Barcode Scanner

A service that makes barcode scanners available on the network for IoT use.


## Usage

1. Installation
    ```
        sudo pip3 install paho-mqtt evdev
        git clone https://github.com/xengineering/iot-barcode-scanner.git
        cd iot-barcode-scanner
        sudo make install
    ```
2. Configure ```/etc/xengineering.eu/iot_barcode_scanner/config.json```
3. Run ```sudo eu.xengineering.iot_barcode_scanner.scanner &```
4. Run ```eu.xengineering.iot_barcode_scanner.transmitter &```
5. Listen to MQTT output (e.g. with ```mosquitto_sub -h localhost -t "xengineering.eu/iot-barcode-scanner"```)


## Milestones

- [x] MVP: Forward keyboard/scanner input to MQTT topic
- [x] Use config file
- [x] Disable scanner as regular input source and bind it only to the service
- [x] Split into two executables to reduce root-priviledged code
- [x] Write Makefile for easy installation
- [ ] Make python package installation portable across linux distributions
- [ ] Implement systemd services
- [ ] Implement auto discovery of barcode scanners
- [ ] Package it for Arch Linux


## Dependencies

- ```python-paho-mqtt```
- ```python-evdev```


## Links

- [python-evdev documentation](https://python-evdev.readthedocs.io/en/latest/index.html)
- [Please answer this guy!](https://stackoverflow.com/questions/49850238/redirect-usb-hid-barcode-output-to-dev-tty-device)
