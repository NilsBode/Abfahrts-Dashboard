import datetime
import itertools
import logging
import numpy as np
import requests
import json
import configparser
import pandas as pd
import datetime as dt
import math
from urllib.parse import quote

anfragen_counter = 0

config = configparser.ConfigParser()
config.read('config.ini')

try:
    API_KEY = config['RMV']['api_key']
except KeyError:
    print("Fehler: 'api_key' nicht in [RMV] der config.ini gefunden.")
    exit()

if API_KEY == "ENTER YOUR KEY HERE":
    raise KeyError("API KEY MUST BE EDITED IN config.ini")

START_STATION_ID = "3029137"  # Mainz-Hechtsheim Carl-Zeiss-Straße
VIA_STATION_ID = "3006904"  # Mainz Hbf


def get_tram_data(start_station_id, end_station_id):
    url_trip = (
        f"https://www.rmv.de/hapi/trip"
        f"?accessId={API_KEY}"
        f"&originId={start_station_id}"
        f"&destId={end_station_id}"
        f"&products=160"  # 160 = Straßenbahn
        f"&poly=1"
        f"&format=json"
    )

    response = requests.get(url_trip)
    response.raise_for_status()
    data = response.json()

    logging.log(logging.DEBUG, "")
    print(f"Anfrage {anfragen_counter}")


if __name__ == '__main__':
    get_tram_data(START_STATION_ID, VIA_STATION_ID)
