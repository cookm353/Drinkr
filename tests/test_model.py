from unittest import TestCase
from models import User, db
from app import app

class Test_User(TestCase):
    def setUp(self):
        User.query.delete()
        
        alice = {
            'username': 'alice', 'password': User.hash_password('test123'),
            'email': 'alice@test.com', 'firstName': 'Alice', 'lastName': 'Tester'
        }
        bob = {
            'username': 'bob', 'password': User.hash_password('test123'),
            'email': 'bob@test.com', 'firstName': 'Bob', 'lastName': 'Tester'
        }
        
        db.session.add_all([alice, bob])
        db.session.commit()
        
    def tearDown(self):
        db.session.rollback()
        
    def test_getting_user(self):
        alice = User.get(1)
        
        self.assertIsInstance(alice, User)
        self.assertEqual(alice.username, 'alice')
        
    def test_registration(self):
        ...