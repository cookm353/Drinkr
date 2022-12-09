from app import app
from models import db, User, Ingredient, Drink, DrinkIngredient, Comment, UserFavorites, UserIngredients
import requests

# Build seed files

def getIngredients():
    """Get ingredients from API and write to text file"""
    url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
    ingredients = requests.get(url).json()['drinks']
    
    with open('seed_files/ingredients.txt', 'a') as file:
        for ingredient in ingredients:
            file.write(f'{ingredient["strIngredient1"]}\n')
            
def getDrinks():
    """Get drinks for each ingredient from API, remove duplicates, and write to text file"""
    url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i='
    unique_drinks = set()
    
    with open('seed_files/ingredients.txt', 'r') as file:
        ingredients = file.readlines()
        
    ingredients = [ingredient[:-1].replace(' ', '%20') for ingredient in ingredients]
    
    for ingredient in ingredients:
        print(f'Getting drinks for {ingredient}...')
        resp = requests.get(f"{url}{ingredient.replace(' ', '%20')}").json()['drinks']
        drinks = [drink['strDrink'] for drink in resp]
        for drink in drinks:
            unique_drinks.add(drink)
        print('Done!')
        
    with open('seed_files/drinks.txt', 'a') as file:
        for drink in unique_drinks:
            file.write(f'{drink}\n')


# Build DB

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
    
def addDrinkIngredients():
    """Populate table ingredients for each drink"""
    drinks = Drink.getAll()
    ingredients = Ingredient.getAll()
    
    # Make API call for each drink and add rows to table
    for drink in drinks:
        url = drink.url
        resp = requests.get(url).json()['drinks'][0]
        
        drinkIngredients = []
        
        # Get ingredients in drink
        for k, v in resp.items():
            if "Ingredient" in k and v is not None:
                drinkIngredients.append(v)
                
        # Check if ingredients
        for ingredient in drinkIngredients:
            if Ingredient.getByName(ingredient):
                d_id = drink.id
                i_id = Ingredient.getByName(ingredient).id
                newDrinkIngredient = DrinkIngredient(
                    ingredient_id=i_id, drink_id=d_id)
                db.session.add(newDrinkIngredient)

def addUserIngredients():
    """Build user's cabinets"""
    aliceIngredients = [
        UserIngredients(user_id=1, ingredient_id=3), 
        UserIngredients(user_id=1, ingredient_id=1),
        UserIngredients(user_id=1, ingredient_id=12),
        UserIngredients(user_id=1, ingredient_id=20),
        UserIngredients(user_id=1, ingredient_id=9),
        UserIngredients(user_id=1, ingredient_id=5),
        UserIngredients(user_id=1, ingredient_id=31)
    ]
    
    bobIngredients = [
        UserIngredients(user_id=2, ingredient_id=37),
        UserIngredients(user_id=2, ingredient_id=39),
        UserIngredients(user_id=2, ingredient_id=23),
        UserIngredients(user_id=2, ingredient_id=45),
        UserIngredients(user_id=2, ingredient_id=43),
        UserIngredients(user_id=2, ingredient_id=67)
    ]
    
    for ingredient in aliceIngredients:
        db.session.add(ingredient)
        
    for ingredient in bobIngredients:
        db.session.add(ingredient)

def addUserFavorites():
    aliceFavorites = [
        UserFavorites(user_id=1, drink_id=28),
        UserFavorites(user_id=1, drink_id=50),
        UserFavorites(user_id=1, drink_id=46),
        UserFavorites(user_id=1, drink_id=66),
        UserFavorites(user_id=1, drink_id=78)
    ]
    
    bobFavorites = [
        UserFavorites(user_id=2, drink_id=85),
        UserFavorites(user_id=2, drink_id=129),
        UserFavorites(user_id=2, drink_id=174),
        UserFavorites(user_id=2, drink_id=238),
        UserFavorites(user_id=2, drink_id=122),
        UserFavorites(user_id=2, drink_id=270)
    ]
    
    for drink in aliceFavorites:
        db.session.add(drink)
        
    for drink in bobFavorites:
        db.session.add(drink)

def addComments():
    manhattan = Comment(
        content="Try adding orange bitters and leaving out the cherry, you won't be disappointed",
        rating=3,
        user_id=2,
        drink_id=238
    )
    
    frenchConnection = Comment(
        content="Really hits the spot when you want something with a punch that goes down smoothly",
        rating=5,
        user_id=2,
        drink_id=122
    )
    
    db.session.add(manhattan)
    db.session.add(frenchConnection)


def main():
    # Reset tables
    db.drop_all()
    db.create_all()
    
    # Build seed files
    getIngredients()
    getDrinks()
    
    # Add main tables
    print('Adding users...')
    addUsers()
    print('Adding ingredients...')
    addIngredients()
    print('Adding drinks...')
    addDrinks()
    
    # Commit changes
    db.session.commit()
    
    # Add tables based on ones above
    print('Adding drink ingredients...')
    addDrinkIngredients()
    print("Building user's cabinets...")
    addUserIngredients()
    print('Adding comments...')
    addComments()
    print('Adding favorites...')
    addUserFavorites()
    db.session.commit()
    

if __name__ == "__main__":
    main()