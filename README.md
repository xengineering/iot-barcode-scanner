

# IoT Barcode Scanner

A service that makes barcode scanners available on the network for IoT use.


## Usage

1. Installation
    ```
        sudo pip3 install paho-mqtt evdev
        git clone https://github.com/xengineering/iot-barcode-scanner.git
        cd iot-barcode-scanner
        sudo make install
        sudo useradd -Urs /usr/bin/nologin iotbarcode
    ```
2. Configure ```/etc/iot_barcode/config.json```
3. Run ```sudo systemctl enable --now iot-barcode.target```
5. Listen to MQTT output (e.g. with ```mosquitto_sub -h localhost -t "xengineering.eu/iot-barcode"```)


## Milestones

- [x] MVP: Forward keyboard/scanner input to MQTT topic
- [x] Use config file
- [x] Disable scanner as regular input source and bind it only to the service
- [x] Split into two executables to reduce root-priviledged code
- [x] Write Makefile for easy installation
- [x] Implement systemd services
- [ ] Package it for Arch Linux
- [ ] Make python package installation portable across linux distributions
- [ ] Implement auto discovery of barcode scanners


## Dependencies

- ```python-paho-mqtt```
- ```python-evdev```


## Links

- [python-evdev documentation](https://python-evdev.readthedocs.io/en/latest/index.html)
- [Please answer this guy!](https://stackoverflow.com/questions/49850238/redirect-usb-hid-barcode-output-to-dev-tty-device)
