#!/usr/bin/python3


"""Executable to transmit the Barcode Data to MQTT without root Priviledges"""


from iot_barcode_scanner.static import KEYMAP
import iot_barcode_scanner.config as config
from iot_barcode_scanner.mqtt import MqttService


def main():
    try:

        # read config
        cfg = config.get_config()
        fifo_path = cfg["scanner"]["fifo_path"]
        topic = cfg["mqtt"]["topic"]

        # setup mqtt
        mqtt_service = MqttService(cfg)
        mqtt_service.run()

        barcode = ""

        while True:
            with open(fifo_path, "r") as fifo:
                keycode = fifo.read()
            character = KEYMAP[keycode]
            barcode += character
            if character is "\n":
                mqtt_service.client.publish(
                    topic,
                    payload=barcode,
                    qos=0,
                    retain=False
                )
                barcode = ""

    except KeyboardInterrupt:
        pass


if __name__ == "__main__":
    main()
