from unittest import TestCase
from models import db, User, Glass
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
    ...