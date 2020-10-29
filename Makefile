

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
	$(INSTALL_PROGRAM) iot_barcode_daemon $(bindir)/

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
	$(INSTALL_DATA) iot-barcode.service $(systemddir)/
	$(INSTALL_DATA) iot-barcode-device-handler.service $(systemddir)/

	# install license
	mkdir -p $(sharedir)/licenses/
	$(INSTALL_DATA) LICENSE $(sharedir)/licenses/$(PKGNAME)


uninstall:

	rm -f $(bindir)/iot_barcode_device_handler
	rm -f $(bindir)/iot_barcode_daemon
	rm -f $(libdir)/__init__.py
	rm -f $(libdir)/config.py
	rm -f $(libdir)/mqtt.py
	rm -f $(libdir)/static.py
	rm -f $(systemddir)/iot-barcode.service
	rm -f $(systemddir)/iot-barcode-device-handler.service
	rm -f $(sharedir)/licenses/$(PKGNAME)
