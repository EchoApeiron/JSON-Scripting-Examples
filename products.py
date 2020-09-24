import json

def loadJSONfromFile(file):
    with open(file) as f:
        data = json.load(f)
    
    return data

def writeJSONtoFile(file, data):
    with open(file, 'w') as jsonfile:
        json.dump(data, jsonfile, indent=4, sort_keys=True)

def stockItem(category, price, name, stocked):
    newItem = {
        "category" : category,
        "price" : price,
        "stocked" : stocked,
        "name" : name
    }

    return newItem


def getStockByCategory(data, category):
    stock = []

    for d in data:
        if d['category'] == category:
            stock.append(d)

    return stock

def getStockByStatus(data, status):
    stock = [] 

    for d in data: 
        if d['stocked'] == status:
            stock.append(d)

    return stock

def getStockByCategoryAndStatus(data, category, status = True):
    stock = getStockByCategory(data, category)
    stock = getStockByStatus(stock, status)
            
    return stock