from fastapi import FastAPI
import json 

app = FastAPI()

with open("json_data.json") as fi:
    data = json.load(fi)

@app.get("/{natal}/{day}/{market}")
async def get_json_data(natal:str ,day:str ,market:str ):
    print(natal , day ,market)
    input_data = {}
    input_data["natal"] = natal
    input_data["day"] = day
    input_data["market"] = market

    #appending user input for any validation
    data.update(input_data)

    # returning data with res key
    return {"result":data}