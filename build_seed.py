# Save contents of API to text files to build certain tables

import requests


def getDrinks():
    """Get drinks from API and write to text file"""
    url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f='
    
    letters = ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
               'n', 'o', 'p', 'q', 'r', 's', 't', 'v', 'w', 'y', 'z')
    
    drinks = []
    
    for letter in letters:
        drinks_resp = requests.get(f'{url}{letter}').json()['drinks']
        for drink in drinks_resp:
            drinks.append(drink['strDrink'])  
        
    
    with open('seed_files/drinks.txt', 'a') as file:
        for drink in drinks:
            file.write(f'{drink}\n')
        

def getGlasses():
    """Get glasses from API and write to text file"""
    url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?g=list'
    glasses = requests.get(url).json()['drinks']
    
    
    with open('seed_files/glasses.txt', 'a') as file:
        for glass in glasses:
            file.write(f'{glass["strGlass"]}\n')


def getIngredients():
    """Get ingredients from API and write to text file"""
    url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
    ingredients = requests.get(url).json()['drinks']
    
    with open('seed_files/ingredients.txt', 'a') as file:
        for ingredient in ingredients:
            file.write(f'{ingredient["strIngredient1"]}\n')


def main():
    # getDrinks()
    # getGlasses()
    getIngredients()
    
if __name__ == "__main__":
    main()