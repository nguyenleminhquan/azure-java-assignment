import yaml
from yaml.loader import SafeLoader
import os

# Open the file and load the file
def getTag():
    with open('docker-compose.yaml') as f:
        data = yaml.load(f, Loader=SafeLoader)
        tag = data['services']['java-assignment']['image']
        tag = tag.split(':')
        return tag[1]
print(getTag())