

PKGNAME=iot_barcode
PREFIX=/usr
INSTALL=install
INSTALL_PROGRAM=$(INSTALL) -m 755
INSTALL_DATA=$(INSTALL) -m 644

bindir=$(DESTDIR)$(PREFIX)/bin
sharedir=$(DESTDIR)$(PREFIX)/share
confdir=$(DESTDIR)/etc/$(PKGNAME)
libdir=$(DESTDIR)$(PREFIX)/lib/python3/dist-packages/$(PKGNAME)
systemddir=$(DESTDIR)/lib/systemd/system


.PHONY: install uninstall


install:

	# install executables
	mkdir -p $(bindir)
	$(INSTALL_PROGRAM) iot_barcode_device_handler $(bindir)/
	$(INSTALL_PROGRAM) iot_barcode_transmitter $(bindir)/

	# install library / package
	mkdir -p $(libdir)/
	$(INSTALL_DATA) iot_barcode/__init__.py $(libdir)/__init__.py
	$(INSTALL_DATA) iot_barcode/config.py $(libdir)/config.py
	$(INSTALL_DATA) iot_barcode/mqtt.py $(libdir)/mqtt.py
	$(INSTALL_DATA) iot_barcode/static.py $(libdir)/static.py

	# install config file
	mkdir -p $(confdir)/
	$(INSTALL_DATA) config.json $(confdir)/config.json

	# install systemd unit files
	$(INSTALL_DATA) systemd/iot-barcode-transmitter.service $(systemddir)/
	systemctl enable iot-barcode-transmitter.service
	$(INSTALL_DATA) systemd/iot-barcode-device-handler.service $(systemddir)/
	systemctl enable iot-barcode-device-handler.service
	$(INSTALL_DATA) systemd/iot-barcode.target $(systemddir)/
	systemctl daemon-reload

	# install license
	mkdir -p $(sharedir)/licenses/
	$(INSTALL_DATA) LICENSE $(sharedir)/licenses/$(PKGNAME)


uninstall:

	rm -f $(bindir)/iot_barcode_device_handler
	rm -f $(bindir)/iot_barcode_transmitter
	rm -f $(libdir)/__init__.py
	rm -f $(libdir)/config.py
	rm -f $(libdir)/mqtt.py
	rm -f $(libdir)/static.py
	systemctl disable iot-barcode-transmitter.service
	rm -f $(systemddir)/iot-barcode-transmitter.service
	systemctl disable iot-barcode-device-handler.service
	rm -f $(systemddir)/iot-barcode-device-handler.service
	systemctl disable iot-barcode.target
	rm -f $(systemddir)/iot-barcode.target
	rm -f $(sharedir)/licenses/$(PKGNAME)
