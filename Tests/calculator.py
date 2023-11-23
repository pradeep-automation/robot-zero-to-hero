import requests


def add(a: float, b: float):
    return a + b


def get_resp(url):
    resp = requests.get(url)
    return resp.status_code
