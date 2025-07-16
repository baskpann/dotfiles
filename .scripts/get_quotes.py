import requests
import random

request_urls = [
    'https://yurippe.vercel.app/api/quotes?character=itachi%20uchiha&random=1',
    'https://yurippe.vercel.app/api/quotes?character=jiraiya&random=1',
    'https://yurippe.vercel.app/api/quotes?character=narut&random=1',
    'https://yurippe.vercel.app/api/quotes?character=luffy&random=1',
    'https://yurippe.vercel.app/api/quotes?character=sasuke&random=1',
    'https://yurippe.vercel.app/api/quotes?character=kakashi&random=1',
    'https://yurippe.vercel.app/api/quotes?character=tsunade&random=1',
    'https://yurippe.vercel.app/api/quotes?character=obito&random=1',
    'https://yurippe.vercel.app/api/quotes?character=zoro&random=1',
    'https://yurippe.vercel.app/api/quotes?character=madara&random=1',
    'https://yurippe.vercel.app/api/quotes?character=pain&random=1',
    'https://yurippe.vercel.app/api/quotes?character=shikamaru&random=1',
    'https://yurippe.vercel.app/api/quotes?character=shikaku&random=1',
    'https://yurippe.vercel.app/api/quotes?character=rock%20lee&random=1',
    'https://yurippe.vercel.app/api/quotes?character=pikachu&random=1',
    'https://yurippe.vercel.app/api/quotes?character=shanks&random=1',
    'https://yurippe.vercel.app/api/quotes?character=nagato&show=naruto&random=1',
    'https://yurippe.vercel.app/api/quotes?character=zabuza&random=1',
    'https://quotes.alakhpc.com/quotes?show=Modern%20Family&short=true',
    'https://quotes.alakhpc.com/quotes?show=How%20I%20met%20your%20mother&short=true',
    'https://quotes.alakhpc.com/quotes?show=Brooklyn%20Nine-Nine&short=true',
    'https://quotes.alakhpc.com/quotes?show=suits&short=true',
    'https://quotes.alakhpc.com/quotes?show=friends&short=true',
    'https://quotes.alakhpc.com/quotes?show=lucifer&short=true',
    'https://api.gameofthronesquotes.xyz/v1/random',
    'https://api.chucknorris.io/jokes/random',
    'https://icanhazdadjoke.com/',
    'https://officeapi.akashrajpurohit.com/quote/random',
    'https://sv443.net/jokeapi/v2/joke/Any?blacklistFlags=nsfw,religious,racist,sexist,explicit',
    'https://zenquotes.io/api/quotes/today',
]

url_idx = random.randint(0, (len(request_urls) - 1))

request_url = request_urls[url_idx]

headers = {
    'accept': 'application/json,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
    'accept-language': 'en-US,en;q=0.9',
    'cache-control': 'max-age=0',
    'priority': 'u=0, i',
}

req = requests.request("GET", url=request_url, headers=headers)

print('---')
if req.status_code == requests.codes.ok:
    response = req.json()
else:
    print(f'Unlucky day!! -- {req.status_code}')
    exit(0)

if "dadjoke" in request_url:
    print(f'{response["joke"]}')
elif "yurippe.vercel" in request_url:
    # This API returns a list with 1 dict (since &random=1 in the query)
    print(f'~~ {response[0]["show"]} ~~\n{response[0]["quote"]}\n~ {response[0]["character"]}')
elif "alakhpc" in request_url:
    print(f'~~ {response["show"]} ~~\n{response["text"]}\n~ {response["character"]}')
elif "gameofthrones" in request_url:
    print(f'~~ Game of Thrones ~~\n{response["sentence"]}\n~ {response["character"]["name"]}')
elif "chucknorris" in request_url:
    print(f'{response["value"]}')
elif "officeapi" in request_url:
    print(f'~~ The Office ~~\n{response["quote"]}\n~ {response["character"]}')
elif "zenquotes" in request_url:
    _idx = random.randint(0, (len(response) - 1))
    print(f'{response[_idx]["q"]}  ~ {response[_idx]["a"]}')
elif "sv443" in request_url:
    if response['type'] == 'twopart':
        print(f'{response["setup"]}\n{response["delivery"]}')
    else:
        print(f'{response["joke"]}')
else:
    print("If you see this print, you messed up so hard!")
print('---')
