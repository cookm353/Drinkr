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
        
        alice = User(username='alice', password=User.hashPassword('test123'),
                     email='alice@test.com')
        bob = User(username='bob', password=User.hashPassword('test123'),
                     email='bob@test.com')
        
        db.session.add_all([alice, bob])
        
        bourbon = Ingredient(name='Bourbon')
        gin = Ingredient(name='Gin')
        rum = Ingredient(name='Rum')
        
        db.session.add_all([bourbon, gin, rum])
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
        
        """UserIngredients-related tests"""
        
        """UserFavorites-related tests"""
        
        """Comment-related test"""
        
        """DrinkIngredient-related tests"""
        
        """Relationship tests"""
        # Ingredient - drinks
        # User - ingredients
        # User - favorites
        # User - comments
        # Drink - comments


class TestDrink(TestCase):
    def setUp(self):
        ...
    
    def tearDown(self):
        db.session.rollback()

    
class TestIngredient(TestCase):
    def setUp(self):
        Ingredient.query.delete()
        
        bourbon = Ingredient(name='Bourbon')
        gin = Ingredient(name='Gin')
        rum = Ingredient(name='Rum')
        
        db.session.add_all([bourbon, gin, rum])
        db.session.commit()
        
    def tearDown(self):
        db.session.rollback()
        
