from app import app
from models import db, User, Glass, CustomDrink, Ingredient, Drink, DrinkIngredient
import requests

db.drop_all()
db.create_all()

def addUsers():
    User.query.delete()

    aliceData = {
        'username': 'alice', 'email': 'alice@test.com', 'password': 'test123'
    }
    bobData = {
        'username': 'bob', 'email': 'bob@test.com', 'password': 'qwerty'
    }

    User.register(aliceData)
    User.register(bobData)

def getGlasses():
    Glass.query.delete()

    url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?g=list"

    glassesResp = requests.get(url).json()['drinks']
    glasses = [glass['strGlass'] for glass in glassesResp]

    for glass in glasses:
        newGlass = Glass(name=glass)
        db.session.add(newGlass)
        
    db.session.commit()
    

def getIngredients():
    Ingredient.query.delete()

    url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

    ingredientsResp = requests.get(url).json()['drinks']
    ingredients = [ingredient['strIngredient'] for ingredient in ingredientsResp]

    for ingredient in ingredients:
        print(ingredient)
        newIngredient = Ingredient(name=ingredient)
        db.session.add(newIngredient)
        
    db.session.commit()


def getDrinks():
    Drink.query.delete()
    
    with open('seed_files/drinks.txt', 'r') as file:
        drinks = file.readlines()
        
    drinks = [drink.replace(' \n', '') for drink in drinks]
        
    for drink in drinks:
        newDrink = Drink(name=drink)
        
        db.session.add(newDrink)
        
    db.session.commit()
    

def main():
    addUsers()
    getGlasses()
    getIngredients()
    getDrinks()
    

if __name__ == "__main__":
    main()