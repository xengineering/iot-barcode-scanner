#!/usr/bin/python3


"""Executable to transmit the Barcode Data to MQTT without root Priviledges"""


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

        while True:
            with open(fifo_path, "r") as fifo:
                text = fifo.read()
            mqtt_service.client.publish(
                topic,
                payload=text,
                qos=0,
                retain=False
            )

    except KeyboardInterrupt:
        pass


if __name__ == "__main__":
    main()
