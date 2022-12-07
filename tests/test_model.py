from unittest import TestCase
from models import db, User, Ingredient, UserIngredients, UserFavorites, Drink, DrinkIngredient
from app import app

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///drinkr_test'
app.config['SQLALCHEMY_ECHO'] = False
app.config['WTF_CSRF_ENABLED'] = False
app.config['TESTING'] = True
app.config['DEBUG_TB_HOSTS'] = ['dont-show-debug-toolbar']

db.drop_all()
db.create_all()

class TestModels(TestCase):
    def setUp(self):
        User.query.delete()
        Ingredient.query.delete()
        Drink.query.delete()
        
        alice = User(username='alice', password=User.hashPassword('test123'),
                     email='alice@test.com')
        bob = User(username='bob', password=User.hashPassword('test123'),
                     email='bob@test.com')
        
        db.session.add_all([alice, bob])
        
        bourbon = Ingredient(name='Bourbon')
        gin = Ingredient(name='Gin')
        rum = Ingredient(name='Rum')
        
        db.session.add_all([bourbon, gin, rum])
        
        manhattan = Drink(name='Manhattan')
        martini = Drink(name='Martini')
        daquiri = Drink(name='Daquiri')
        
        db.session.add_all([manhattan, martini, daquiri])
        db.session.commit()
        
        cabinet1 = UserIngredients(user_id=1, ingredient_id=1)
        cabinet2 = UserIngredients(user_id=2, ingredient_id=2)
        cabinet3 = UserIngredients(user_id=1, ingredient_id=3)
        
        db.session.add_all([cabinet1, cabinet2, cabinet3])
        
        db.session.commit()
        
    def tearDown(self):
        db.session.rollback()

    """User-related tests"""
        
    def testGettingUser(self):
        alice = User.get(1)
        
        self.assertIsInstance(alice, User)
        self.assertEqual(alice.username, 'alice')
        
    def testGettingAllUsers(self):
        users = User.getAll()
        
        self.assertIsInstance(users, list)
        
        for user in users:
            self.assertIsInstance(user, User)
            
    def testGettingByValidUserName(self):
        user = User.getByUsername('alice')
        
        self.assertIsInstance(user, User)
        self.assertEqual(user.username, 'alice')
        
    def testRegistration(self):
        charlieData = {
            'username': 'charlie', 'password': 'test123', 
            'email': 'charlie@test.com'
        }
        User.register(charlieData)
        
        charlie = User.get(3)
        
        self.assertEqual(charlie.username, 'charlie')
        self.assertIsInstance(charlie, User)
        
    def testValidLogin(self):
        user = User.authenticate('alice', 'test123')
        
        self.assertEqual(user.username, 'alice')
        
    def testInvalidLogin(self):
        user = User.authenticate('alice', 'qwerty')
        
        self.assertFalse(user)
        
    def testUserRepr(self):
        """Testing __repr__"""
        user = User.get(1)
        
        self.assertEqual(repr(user), '<User username=alice email=alice@test.com>')
        
    def testDeletingUser(self):
        user = User.get(1)
        self.assertEqual(user.username, 'alice')
        
        User.delete(1)
        
        with self.assertRaises(Exception):
            user = User.get(1)
            
    """Ingredient-related tests"""
        
    def testGettingIngredient(self):
        bourbon = Ingredient.get(1)
        
        self.assertIsInstance(bourbon, Ingredient)
        self.assertEqual(bourbon.name, 'Bourbon')
        
    def testGettingNonexistentIngredient(self):
        with self.assertRaises(Exception):
            drink = Ingredient.get(4)
            
    def testGettingIngredientByName(self):
        bourbon = Ingredient.getByName('Bourbon')
        
        self.assertIsInstance(bourbon, Ingredient)
        self.assertEqual(bourbon.name, 'Bourbon')
            
    def testGettingMissingIngredientByName(self):
        vermouth = Ingredient.getByName('Vermouth')
        
        self.assertNotIsInstance(vermouth, Ingredient)
        self.assertEqual(vermouth, None)
            
            
    def testGettingAll(self):
        ingredients = Ingredient.getAll()
        
        self.assertIsInstance(ingredients, list)
        for ingredient in ingredients:
            self.assertIsInstance(ingredient, Ingredient)
            
    def testIngredientRepr(self):
        gin = Ingredient.get(2)
        
        self.assertEqual(repr(gin), '<Ingredient name=Gin>')
        
    """Drink-related tests"""
        
    def testGettingDrink(self):
        drink = Drink.get(1)
        
        self.assertIsInstance(drink, Drink)
        self.assertEqual(drink.name, 'Manhattan')
        
    def testGettingInvalidDrink(self):
        with self.assertRaises(Exception):
            drink = Drink.get(4)
        
    def testGettingDrinkByName(self):
        manhattan = Drink.getByName('Manhattan')
        
        self.assertIsInstance(manhattan, Drink)
        self.assertEqual(manhattan.name, 'Manhattan')
        
    def testGettingDrinkByInvalidName(self):
        margarita = Drink.getByName('Margarita')
        
        self.assertNotIsInstance(margarita, Drink)
        self.assertEqual(margarita, None)
        
    def testGettingAllDrinks(self):
        drinks = Drink.getAll()
        
        self.assertIsInstance(drinks, list)
        for drink in drinks:
            self.assertIsInstance(drink, Drink)
    
    def testDrinkRepr(self):
        manhattan = Drink.get(1)
        
        self.assertEqual(repr(manhattan), '<Drink name=Manhattan>')
    
    """UserIngredients-related tests"""
    
    def testAddingIngredient(self):
        UserIngredients.addIngredient(2, 3)
        userIngredient = UserIngredients.query.filter_by(user_id=2, ingredient_id=3).first()
        
        self.assertIsInstance(userIngredient, UserIngredients)
        
    def testCheckingForPresentIngredient(self):
        ingredientCount = UserIngredients.checkForIngredient(2, 2)
        
        self.assertEqual(ingredientCount, 1)
        
    def testCheckingForMissingIngredient(self):
        ingredientCount = UserIngredients.checkForIngredient(1, 2)
        
        self.assertEqual(ingredientCount, 0)
        
    def testRemovingIngredient(self):
        UserIngredients.removeIngredient(2, 2)
        ingredientCount = UserIngredients.checkForIngredient(2, 2)
        
        self.assertEqual(ingredientCount, 0)
    
    """UserFavorites-related tests"""
    
    """Comment-related test"""
    
    """DrinkIngredient-related tests"""
    
    """Relationship tests"""
    # Ingredient - drinks
    # User - ingredients
    # User - favorites
    # User - comments
    # Drink - comments