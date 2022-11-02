from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt

db = SQLAlchemy()
bcrypt = Bcrypt()

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///drinkr_test'
app.config['SQLALCHEMY_ECHO'] = False
app.config['WTF_CSRF_ENABLED'] = False
app.config['TESTING'] = True
app.config['DEBUG_TB_HOSTS'] = ['dont-show-debug-toolbar']

db.drop_all()
db.create_all()

def connect_db(app):
    db.app = app
    db.init_app(app)


class User(db.Model):
    """Class representing a user"""
    
    __tablename__ = 'users'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.Text, nullable=False, unique=True)
    password = db.Column(db.Text, nullable=False)
    email = db.Column(db.Text, nullable=False)
    firstName = db.Column(db.Text, nullable=False)
    lastName = db.Column(db.Text, nullable=False)
    
    # Registration and authentication related methods
    
    @classmethod
    def register(cls, formData):
        """Create a new user based on form data"""
        username = formData['username']
        password = formData['password']
        email = formData['email']
        firstName = formData['firstName']
        lastName = formData['lastName']
        
        hashed_pwd = cls.hash_password(password)
        
        return cls(username=username, password=hashed_pwd, email=email,
                   firstName=firstName, lastName=lastName)
        
    @classmethod
    def authenticate(cls, loginData):
        """Verify a user's login credentials"""
        username = loginData['username']
        pwd = loginData['password']
        
        user = User.query.filter_by(username=username).first()
        
        if user and bcrypt.check_password_hash(user.password, pwd):
            return user
        else:
            return False
        
    @staticmethod
    def hash_password(password):
        """Helper method for seed"""
        return bcrypt.generate_password_hash(password).decode('utf-8')
    
    # Utility methods
    
    @classmethod
    def get(cls, userId):
        """Return a user based on their id"""
        return cls.query.get_or_404(userId)
    
    @classmethod
    def getAll(cls):
        """Return all users"""
        return cls.query.all()
    
    def edit(self):
        ...
    
    # Dunder methods
    
    def __repr__(self):
        return f"<User username={self.username} firstName={self.firstName} lastName={self.lastName} email={self.email}>"
    
    def __str__(self):
        return "Username:\t{self.username}\nEmail:\t{self.email}\nFirst name:\t{self.firstName}\nLast name:\t{self.lastName}"
    
class Drink(db.Model):
    """Class modeling a drink"""
    
    __tablename__ = "drinks"
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.Text, nullable=False)
    instructions = db.Column(db.Text, nullable=False)
    is_alcoholic = db.Column(db.Bool, nullable=False)
    imgURL = db.Column(db.Text, nullable=True)
    videoURL = db.Column(db.Text, nullable=True)
    
    @classmethod
    def add(cls, drinkData, userId):
        """Add a custom drink to the DB"""
        user = user.get(userId)
        
        ...
        
    @classmethod
    def get(cls, drinkId):
        """Retrieve a drink a user has added"""
        return cls.query.get_or_404(drinkId)
    
    @classmethod
    def get_by_user(cls, userId):
        """Retrieve all of the drinks a user has added"""
        user = user.get(userId)
        
    def edit(self, drinkData):
        """Edit a custom drink"""
        ...
        
    @classmethod
    def delete(cls, drinkId):
        """Delete a custom drink"""
        ...
        

class Glass(db.Model):
    """Class representing a glass type"""
    
    __tablename__ = 'glasses'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.Text, nullable=False)
    
    # Utility methods
    
    @classmethod
    def get(cls, glassId):
        """Fetch a glass"""
        return cls.query.get_or_404(glassId)
    
    @classmethod
    def get_all(cls):
        return cls.query.all()
    
    # Dunders
    
    
class Ingredient(db.Model):
    """Class representing an ingredient"""
    
    __tablename__ = 'ingredients'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.Text, nullable=False)
    
    @classmethod
    def get(cls, id):
        """Return an ingredient"""
        