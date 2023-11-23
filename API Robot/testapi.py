import requests

headers = {"Authorization": "token cd61f441132925ff42be888217818e6d506baa02"}
resp = requests.get("https://vet-qa.membership-nonprod.petco.com/v1/practice/10035849", headers=headers)
print(resp.json()["data"]["name"])
assert "Rancho Mesa Animal Hospital" == resp.json()["data"]["name"]

res = requests.get("https://httpbin.org/basic-auth/user/pass", auth=("user", "pass"))
print(res.status_code)

