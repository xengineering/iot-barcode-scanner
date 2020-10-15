

PKGNAME=iot_barcode_scanner
PREFIX=/usr
INSTALL=install
INSTALL_PROGRAM=$(INSTALL) -m 755
INSTALL_DATA=$(INSTALL) -m 644

bindir=$(DESTDIR)$(PREFIX)/bin
sharedir=$(DESTDIR)$(PREFIX)/share
confdir=$(DESTDIR)/etc/xengineering.eu/$(PKGNAME)
libdir=$(DESTDIR)$(PREFIX)/lib/python3/dist-packages/$(PKGNAME)


.PHONY: install uninstall


install:

	# install executables
	mkdir -p $(bindir)
	$(INSTALL_PROGRAM) barcode_scanner_daemon.py $(bindir)/eu.xengineering.$(PKGNAME).scanner
	$(INSTALL_PROGRAM) barcode_transmit_daemon.py $(bindir)/eu.xengineering.$(PKGNAME).transmitter

	# install library / package
	mkdir -p $(libdir)/
	$(INSTALL_DATA) iot_barcode_scanner/__init__.py $(libdir)/__init__.py
	$(INSTALL_DATA) iot_barcode_scanner/config.py $(libdir)/config.py
	$(INSTALL_DATA) iot_barcode_scanner/mqtt.py $(libdir)/mqtt.py
	$(INSTALL_DATA) iot_barcode_scanner/static.py $(libdir)/static.py

	# install config file
	mkdir -p $(confdir)/
	$(INSTALL_DATA) config.json $(confdir)/config.json

	# install license
	mkdir -p $(sharedir)/licenses/
	$(INSTALL_DATA) LICENSE $(sharedir)/licenses/$(PKGNAME)


uninstall:

	rm -f $(bindir)/eu.xengineering.$(PKGNAME).scanner
	rm -f $(bindir)/eu.xengineering.$(PKGNAME).transmitter
	rm -f $(libdir)/__init__.py
	rm -f $(libdir)/config.py
	rm -f $(libdir)/mqtt.py
	rm -f $(libdir)/static.py
	rm -f $(sharedir)/licenses/$(PKGNAME)
