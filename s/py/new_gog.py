#!/usr/local/bin/python3.10
import requests
import os
import sys
# /usr/bin/env python3
# source https://xa1.at/create-gogs-repo-script/

#  ft $_s/new_gog [repo-name]

# use conda or you need to
# python.exe -m pip install --upgrade requests
# pip install requests 
# conda install requests


if (len(sys.argv) < 1):
    print("GOGS_TOKEN=[token] new_gog [repo-name]")
    exit(1)

authToken = sys.argv[1]
name = sys.argv[2]
print(f"Name: {name}")

# os.system(f"mkdir \"{name}\"")
# os.chdir(f"./{name}")

gogsUser = "z" # <-- replace with your username
gogsHost = "http://wt.wt:62616" 
# gogsHost = "http://127.0.1.42:62616" 
url = f"{gogsHost}/api/v1/admin/users/{gogsUser}/repos"
# authToken = os.environ.get('GOGS_TOKEN')
# authToken = "9e7c7db4f76b4fca6cd11d06f043a93032f0d320"
# http://127.0.1.1:6644/
print(f"url: {url}")

createResponse = requests.post(
    url,
    data={
        'name': name,
        'description': "",
        'private': True
    },
    headers={"Authorization": f"token {authToken}"}
)
print(f"test: {createResponse}")
createJson = createResponse.json()

print(f"createJson: {createJson}")

gitUrl = createJson['clone_url']
# Sanitize if necessary:
# gitUrl = gitUrl.replace(':3000/', '/').replace('http://', 'https://')

print(f"Response: {createJson}")
print(f"Git URL: {gitUrl}")

# os.system(f"git clone \"{gitUrl}\" .")
# os.system(f"git checkout -b main")
# with open("README.md", "w") as text_file:
#     text_file.write(f"# {name}")
# os.system("git add README.md")
# os.system("git commit -m \"Initial commit\"")
# os.system("git push -u origin main")