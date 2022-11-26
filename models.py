from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
import requests

db = SQLAlchemy()
bcrypt = Bcrypt()

def connect_db(app):
    db.app = app
    db.init_app(app)


class User(db.Model):
    """Class representing a user"""
    
    __tablename__ = 'users'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.Text, nullable=False, unique=True)
    password = db.Column(db.Text, nullable=False)
    email = db.Column(db.Text, nullable=False, unique=True)
    
    ingredients = db.relationship('Ingredient', backref='user', secondary='user_ingredients')
    
    # Registration and authentication related methods
    
    @classmethod
    def register(cls, formData):
        """Create a new user based on form data"""
        username = formData['username']
        password = formData['password']
        email = formData['email']
        
        hashed_pwd = cls.hashPassword(password)
        
        newUser = cls(username=username, password=hashed_pwd, email=email)
        
        db.session.add(newUser)
        db.session.commit()
        
    @classmethod
    def authenticate(cls, username, password):
        """Verify a user's login credentials"""
        # username = loginData['username']
        # pwd = loginData['password']-
        
        user = User.query.filter_by(username=username).first()
        
        if user and bcrypt.check_password_hash(user.password, password):
            return user
        else:
            return False
        
    @staticmethod
    def hashPassword(password):
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
    
    @classmethod
    def getByUsername(cls, username):
        """Return a user based on their username"""
        return cls.query.filter_by(username=username).first()
    
    def edit(self):
        ...
        
    @classmethod
    def delete(cls, userId):
        """Delete a user"""
        cls.query.filter_by(id=userId).delete()
        db.session.commit()
    
    # Dunders
    
    def __repr__(self):
        return f"<User username={self.username} email={self.email}>"
    
    def __str__(self):
        return "Username:\t{self.username}\nEmail:\t{self.email}"
          
    
class Ingredient(db.Model):
    """Class representing an ingredient"""
    
    __tablename__ = 'ingredients'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.Text, nullable=False)
    
    @classmethod
    def get(cls, id: int):
        """Return an ingredient"""
        return Ingredient.query.get_or_404(id)
    
    @classmethod
    def getByName(cls, name: str):
        """Return an ingredient using its name"""
        name = name.title()
        return Ingredient.query.filter_by(name=name).first()
    
    @classmethod
    def getAll(cls):
        """Return all ingredients"""
        return Ingredient.query.all()
    
    @classmethod
    def add(cls, ingredientData: dict):
        """Add a new ingredient"""
        name = ingredientData.get('name')
        description = ingredientData.get('description', '')
        type = ingredientData.get('type', '')
        
        newIngredient = Ingredient(name=name, description=description, type=type)
        
    def __repr__(self):
        repr = f"<Ingredient name={self.name}>"
        return repr
    

class Comment(db.Model):
    """Class modeling comments left by users"""
    __tablename__ = 'comments'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    content = db.Column(db.Text, nullable=False)
    rating = db.Column(db.Integer, default=0)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id',
                                                 ondelete='CASCADE',
                                                 onupdate='CASCADE'))
    drink_id = db.Column(db.Integer, db.ForeignKey('drinks.id',
                                                 ondelete='CASCADE',
                                                 onupdate='CASCADE'))
    
    user = db.relationship('User', backref='comment')
    drink = db.relationship('Drink', backref='comment')
    
    
    # Utility methods
    
    @classmethod
    def get(cls, id):
        return cls.query.get_or_404(id)
    
    @classmethod
    def getAll(cls):
        return cls.query.all()
    
    @classmethod
    def getByUser(cls, username):
        """Return all comments a user has made"""
        user = User.getByUsername(username)
        
        return cls.query.filter_by(user_id=user.id).all()
    
    @classmethod
    def getByDrink(cls, drink):
        """Return all comments made on a drink"""
        drink = Drink.getByName(drink)
    
    # Dunders
    
class User_Ingredients(db.Model):
    """Join table for ingredients a user has"""
    __tablename__ = 'user_ingredients'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id', 
                                                  ondelete='CASCADE',
                                                  onupdate='CASCADE'))
    ingredient_id = db.Column(db.Integer, db.ForeignKey('ingredients.id',
                                                        ondelete='CASCADE',
                                                        onupdate='CASCADE'))
   
    
class Drink(db.Model):
    """Table to hold names of drinks and links to API"""
    __tablename__ = 'drinks'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.Text, nullable=False)
    url = db.Column(db.Text, nullable=True)
    img_url = db.Column(db.Text, nullable=True)
    
    
    def __repr__(self):
        return f'<Drink name={self.name}>'
    
    @classmethod
    def get(cls, id):
        """Fetch a drink by its id"""
        return cls.query.get_or_404(id)
    
    @classmethod
    def getByName(cls, drinkName):
        """Fetch a drink by its name"""
        # drinkName = drinkName.title()
        return cls.query.filter_by(name=drinkName).first()
        
    @classmethod
    def getAll(cls):
        """Retrieve all drinks"""
        return cls.query.order_by(cls.name)

    @staticmethod
    def getJSON(url):
        """Make API call and parse response"""
        resp = requests.post(url)
        json = resp.json()
        return Drink.parseJSON(json)
        
    @staticmethod
    def parseJSON(json):
        drinks = json['drinks']
        drinkInfo = []
        
        for drink in drinks:
            variant = {}
            variant['name'] = drink['strDrink']
            variant['glass'] = drink['strGlass']
            variant['instructions'] = drink['strInstructions']
            variant['isAlcoholic'] = drink['strAlcoholic']
            variant['imgURL'] = drink['strDrinkThumb'].replace('\/', '/')
            variant['ingredients'] = []
            
            ingredients = []
            measures = []
            
            for k, v in drink.items():
                if 'Ingredient' in k and v is not None and v != '':
                    ingredients.append(v)
                elif 'Measure' in k and v is not None and v != '':
                    measures.append(v)

            zipped = zip(measures, ingredients)
            for m, i in zipped:
                variant['ingredients'].append(f'{m} {i}'.replace('  ', ' '))
            
            drinkInfo.append(variant)

        return drinkInfo

    
'''
class CustomDrink(db.Model):
    """Class modeling a custom drink uploaded by a user"""
    
    __tablename__ = "custom_drinks"
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.Text, nullable=False)
    instructions = db.Column(db.Text, nullable=False)
    is_alcoholic = db.Column(db.Boolean, nullable=False)
    img_URL = db.Column(db.Text, nullable=True)
    video_URL = db.Column(db.Text, nullable=True)
    glass_id = db.Column(db.Integer, db.ForeignKey('glasses.id',
                                                   onupdate='CASCADE'))
    user_id = db.Column(db.Integer, db.ForeignKey('users.id',
                                                  ondelete='CASCADE',
                                                  onupdate='CASCADE'))
    
    user = db.relationship('User', backref='custom_drinks')
    glass = db.relationship('Glass', backref='custom_drink')
    ingredient = db.relationship('Ingredient', backref='custom_drinks', secondary='drink_ingredients')
    drink_ingredient = db.relationship('DrinkIngredient', backref='custom_drinks')
    
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
    def getByUser(cls, userId):
        """Retrieve all of the drinks a user has added"""
        user = user.get(userId)
        
    @classmethod
    def getByName(cls, name):
        """Return a drink based on its name"""
        cls.query.filter_by(name=name).first()
        
    def edit(self, drinkData):
        """Edit a custom drink"""
        ...
        
    @classmethod
    def delete(cls, drinkId):
        """Delete a custom drink"""
        ...
'''

''
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
    def getAll(cls):
        return cls.query.all()
    
    # Dunders
    
    def __repr__(self):
        return f'<Glass name={self.name}>'


'''                
class DrinkIngredient(db.Model):
    """Join table between drinks and ingredients"""
    __tablename__ = 'drink_ingredients'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    amount = db.Column(db.Text, nullable=False)
    ingredient_id = db.Column(db.Integer, db.ForeignKey('ingredients.id',
                                                        ondelete='CASCADE',
                                                        onupdate='CASCADE'))
    drink_id = db.Column(db.Integer, db.ForeignKey('drinks.id',
                                                   ondelete='CASCADE',
                                                   onupdate='CASCADE'))
   
'''