import pymongo 
from pymongo import MongoClient
import pymongo
import json

client = MongoClient("mongodb://admin:admin@db-node-ex01/archdb?retryWrites=true&w=majority", authSource="admin")
database = client.college
with open('ExportJson.json') as file:
    file_data = json.load(file)
database["authors"].insert_many(file_data)