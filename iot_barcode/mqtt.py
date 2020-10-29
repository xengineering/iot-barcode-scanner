

"""Provide MQTT Functionality for the Package"""


import paho.mqtt.client as mqtt


class MqttService():
    """Bundle for MQTT Functionality"""

    def __init__(self, config):
        self.config = config
        self.client = mqtt.Client()
        self.client.on_connect = self.on_connect

    def run(self):
        self.client.connect(
            self.config["mqtt"]["broker"],
            self.config["mqtt"]["port"],
            60
        )
        self.client.loop_start()

    def on_connect(self, client, userdata, flags, rc):
        client.subscribe(self.config["mqtt"]["topic"])
