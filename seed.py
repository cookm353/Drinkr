from app import app
from models import db, User, Ingredient, Drink, Glass
import requests

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

def addGlasses():
    Glass.query.delete()

    with open('seed_files/glasses.txt', 'r') as file:
        glasses = file.readlines()
        
    glasses = [glass.replace('\n', '').strip() for glass in glasses]
    
    for glass in glasses:
        newGlass = Glass(name=glass)
        db.session.add(newGlass)

def addIngredients():
    Ingredient.query.delete()

    with open('seed_files/ingredients.txt', 'r') as file:
        ingredients = file.readlines()
        
    ingredients = [ingredient.replace('\n', '').strip() for ingredient in ingredients]

    
    for ingredient in ingredients:
        newIngredient = Ingredient(name=ingredient.title())
        db.session.add(newIngredient)

def addDrinks():
    Drink.query.delete()
    
    with open('seed_files/drinks.txt', 'r') as file:
        drinks = file.readlines()
        
    drinks = [drink.replace('\n', '').strip() for drink in drinks]
        
    for drink in drinks:
        baseURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
        drinkURL = f"{baseURL}{drink.replace(' ', '+')}"
        resp = requests.get(drinkURL).json()
        
        imgURL = resp['drinks'][0]['strDrinkThumb']
        
        
        newDrink = Drink(name=drink, url=drinkURL, img_url=imgURL)
        db.session.add(newDrink)
    

def main():
    # Reset tables
    db.drop_all()
    db.create_all()
    
    addUsers()
    # addGlasses()
    addIngredients()
    addDrinks()
    
    # Commit changes
    db.session.commit()
    

if __name__ == "__main__":
    main()