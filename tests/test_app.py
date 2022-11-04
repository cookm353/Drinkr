from unittest import TestCase
from app import app
from models import User, db

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///drinkr_test'
app.config['SQLALCHEMY_ECHO'] = False
app.config['WTF_CSRF_ENABLED'] = False
app.config['TESTING'] = True
app.config['DEBUG_TB_HOSTS'] = ['dont-show-debug-toolbar']

db.drop_all()
db.create_all()

class TestApp(TestCase):
    def setUp(self):
        alice = User(username='alice', password=User.hashPassword('test123'),
                     email='alice@test.com')
        bob = User(username='bob', password=User.hashPassword('test123'),
                   email='bob@test.com')
        
        db.session.add_all([alice, bob])
        db.session.commit()
        
    def tearDown(self):
        db.session.rollback()
        
    def testLogin(self):
        with app.test_client() as client:
            data = {'username':'alice', 'password': 'test123'}
            resp = client.post('/login', data=data, follow_redirects=True)
            html = resp.get_data(as_text=True)
            
            self.assertEqual(resp.status_code, 200)
            
    def testRegistration(self):
        with app.test_client() as client:
            data = {'username':'charlie', 'password':'test123',
                    'email':'charlie@test.com'}
            resp = client.post('/signup', data=data, follow_redirects=True)
            html = resp.get_data(as_text=True)
            
            self.assertEqual(resp.status_code, 200)
            