#!/usr/bin/python3


"""Main executable for the Package / Service"""


import iot_barcode_scanner as ibs


def main():
    try:
        config = ibs.get_config()
        mqtt_service = ibs.MqttService(config)
        mqtt_service.run()
        print("Starting Service")
        while True:
            text = input()
            mqtt_service.client.publish(
                config["mqtt"]["topic"],
                payload=text,
                qos=0,
                retain=False
            )
    except KeyboardInterrupt:
        print("Service stopped")


if __name__ == "__main__":
    main()
