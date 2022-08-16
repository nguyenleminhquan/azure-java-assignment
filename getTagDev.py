import yaml
from yaml.loader import SafeLoader
import os

# Open the file and load the file
def getTag():
    with open('deployment.yaml') as f:
        data = yaml.load(f, Loader=SafeLoader)
        tag = data['spec']['template']['spec']['containers'][0]['image']
        tag = tag.split(':')
        return tag[1]
print(getTag())