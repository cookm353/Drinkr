from unittest import TestCase
from app import app
from models import db, User, Ingredient, UserIngredients, UserFavorites, Drink, DrinkIngredient, Comment

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///drinkr_test'
app.config['SQLALCHEMY_ECHO'] = False
app.config['WTF_CSRF_ENABLED'] = False
app.config['TESTING'] = True
app.config['DEBUG_TB_HOSTS'] = ['dont-show-debug-toolbar']

db.drop_all()
db.create_all()

class TestApp(TestCase):
    def setUp(self):
        User.query.delete()
        Ingredient.query.delete()
        Drink.query.delete()
        Comment.query.delete()
        UserIngredients.query.delete()
        UserFavorites.query.delete()
        DrinkIngredient.query.delete()
        
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
        
        fave1 = UserFavorites(user_id=1, drink_id=1)
        fave2 = UserFavorites(user_id=2, drink_id=2)
        
        db.session.add_all([fave1, fave2])
        
        drinkIngredient1 = DrinkIngredient(ingredient_id=1, drink_id=1)
        drinkIngredient2 = DrinkIngredient(ingredient_id=2, drink_id=2)
        drinkIngredient3 = DrinkIngredient(ingredient_id=3, drink_id=3)
        
        db.session.add_all([drinkIngredient1, drinkIngredient2, drinkIngredient3])
        
        comment1 = Comment(content='Satisfying', user_id=1, drink_id=1)
        comment2 = Comment(content='Classy', user_id=2, drink_id=2)
        comment3 = Comment(content='Tasty', user_id=1, drink_id=3)
        
        db.session.add_all([comment1, comment2, comment3])
        
        db.session.commit()
        
    def tearDown(self):
        db.session.rollback()
        
    def testLoginForm(self):
        with app.test_client() as client:
            resp = client.get('http://localhost:5000/login')
            html = resp.get_data(as_text=True)
            
            self.assertEqual(resp.status_code, 200)
            self.assertIn('Log In', html)
        
    def testLogin(self):
        with app.test_client() as client:
            data = {'username':'alice', 'password': 'test123'}
            resp = client.post('/login', data=data,
                               follow_redirects=True)
            html = resp.get_data(as_text=True)
            
            self.assertEqual(resp.status_code, 200)
            
    def testRegistration(self):
        with app.test_client() as client:
            data = {'username':'charlie', 'password':'test123',
                    'email':'charlie@test.com'}
            resp = client.post('/signup', data=data, follow_redirects=True)
            html = resp.get_data(as_text=True)
            
            self.assertEqual(resp.status_code, 200)
            
    def testCabinetLoggedOut(self):
        with app.test_client() as client:
            resp = client.get('/user/1/cabinet')
            html = resp.get_data(as_text=True)
            
            self.assertEqual(resp.status_code, 302)
            # self.assertIn('View recipe', html)
            
