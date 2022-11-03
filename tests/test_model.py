from unittest import TestCase
from models import db, User, Glass, Ingredient, Drink
from app import app

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///drinkr_test'
app.config['SQLALCHEMY_ECHO'] = False
app.config['WTF_CSRF_ENABLED'] = False
app.config['TESTING'] = True
app.config['DEBUG_TB_HOSTS'] = ['dont-show-debug-toolbar']

db.drop_all()
db.create_all()

class TestUser(TestCase):
    def setUp(self):
        User.query.delete()
        
        alice = User(username='alice', password=User.hashPassword('test123'),
                     email='alice@test.com', firstName='Alice', lastName='Tester')
        bob = User(username='bob', password=User.hashPassword('test123'),
                     email='bob@test.com', firstName='bob', lastName='Tester')
        
        db.session.add_all([alice, bob])
        db.session.commit()
        
    def tearDown(self):
        db.session.rollback()
        
    def testGettingUser(self):
        alice = User.get(1)
        
        self.assertIsInstance(alice, User)
        self.assertEqual(alice.username, 'alice')
        
    def testGettingAllUsers(self):
        users = User.getAll()
        
        self.assertIsInstance(users, list)
        
        for user in users:
            self.assertIsInstance(user, User)
        
    def testRegistration(self):
        charlieData = {
            'username': 'charlie', 'password': 'test123', 
            'email': 'charlie@test.com', 'firstName': 'Charlie', 'lastName': 'Tester'
        }
        User.register(charlieData)
        
        charlie = User.get(3)
        
        self.assertEqual(charlie.firstName, 'Charlie')
        self.assertIsInstance(charlie, User)
        
    def testValidLogin(self):
        loginData = {'username': 'alice', 'password': 'test123'}
        user = User.authenticate(loginData)
        
        self.assertEqual(user.firstName, 'Alice')
        
    def testInvalidLogin(self):
        loginData = {'username': 'alice', 'password': 'qwerty'}
        user = User.authenticate(loginData)
        
        self.assertFalse(user)
        
    def testRepr(self):
        """Testing __repr__"""
        user = User.get(1)
        
        self.assertEqual(repr(user), '<User username=alice firstName=Alice lastName=Tester email=alice@test.com>')
        
    def testEditingUser(self):
        ...
        
    def testDeletingUser(self):
        user = User.get(1)
        self.assertEqual(user.username, 'alice')
        
        User.delete(1)
        
        with self.assertRaises(Exception):
            user = User.get(1)


class TestGlass(TestCase):
    def setUp(self):
        Glass.query.delete()
        
        highball = Glass(name='highball')
        cocktail = Glass(name='cocktail')
        
        db.session.add_all([highball, cocktail])
        db.session.commit()
        
    def tearDown(self):
        db.session.rollback()
        
    def testGettingGlass(self):
        glass = Glass.get(1)
        
        self.assertIsInstance(glass, Glass)
        self.assertEqual(glass.name, 'highball')
        
    def testGettingAllGlasses(self):
        glasses = Glass.getAll()
        
        self.assertIsInstance(glasses, list)
        
        for glass in glasses:
            self.assertIsInstance(glass, Glass)
            
            
class TestDrink(TestCase):
    def setUp(self):
        ...
    
    def tearDown(self):
        db.session.rollback()

    
class TestIngredient(TestCase):
    def setUp(self):
        Ingredient.query.delete()
        
        bourbon = Ingredient(name='Bourbon', type='Whiskey')
        gin = Ingredient(name='Gin', type='Gin')
        scotch = Ingredient(name='Scotch', type='Whiskey')
        
        db.session.add_all([bourbon, gin, scotch])
        db.session.commit()
        
    def tearDown(self):
        db.session.rollback()
        
    def testGettingIngredient(self):
        bourbon = Ingredient.get(1)
        
        self.assertIsInstance(bourbon, Ingredient)
        self.assertEqual(bourbon.name, 'Bourbon')
        
    def testGettingNonexistentIngredient(self):
        with self.assertRaises(Exception):
            drink = Ingredient.get(3)
            
    def testGettingAll(self):
        ingredients = Ingredient.getAll()
        
        self.assertIsInstance(ingredients, list)
        for ingredient in ingredients:
            self.assertIsInstance(ingredient, Ingredient)
            
    def testRepr(self):
        gin = Ingredient.get(2)
        
        self.assertEqual(repr(gin), '<Ingredient name=Gin type=Gin>')