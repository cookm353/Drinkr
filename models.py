import requests
from flask_bcrypt import Bcrypt
from flask_sqlalchemy import SQLAlchemy
from random import randint

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
    favorites = db.relationship('Drink', backref='user', secondary='user_favorites')
    
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
        
    @classmethod
    def delete(cls, userId):
        """Delete a user"""
        cls.query.filter_by(id=userId).delete()
        db.session.commit()
        
    @property
    def favoritesList(self):
        faves = [fave.name for fave in self.favorites]
        return faves
        
    # Dunders
    
    def __repr__(self):
        return f"<User username={self.username} email={self.email}>"
          
    
class Ingredient(db.Model):
    """Class representing an ingredient"""
    
    __tablename__ = 'ingredients'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.Text, nullable=False)
    
    drinks = db.relationship(
        'Drink',
        backref='ingredients',
        secondary='drink_ingredients'
    )
    
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
        return cls.query.order_by(cls.name)
        
    def __repr__(self):
        repr = f"<Ingredient name={self.name}>"
        return repr
    
    @property
    def drinksList(self) -> list:
        """Return drinks that can be made with this ingredient"""
        return [drink.name for drink in self.drinks]   


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
    
    user = db.relationship('User', backref='comments')
    drink = db.relationship('Drink', backref='comments')
    
    
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
    def add(cls, content, user_id, drink_id):
        newComment = cls(content=content, user_id=user_id, drink_id=drink_id)
        db.session.add(newComment)
        db.session.commit()


class UserIngredients(db.Model):
    """Table storing ingredients a user's ingredients"""
    __tablename__ = 'user_ingredients'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id', 
                                                  ondelete='CASCADE',
                                                  onupdate='CASCADE'))
    ingredient_id = db.Column(db.Integer, db.ForeignKey('ingredients.id',
                                                        ondelete='CASCADE',
                                                        onupdate='CASCADE'))
    
    @classmethod
    def addIngredient(cls, user_id, ingredient_id):
        """Add an ingredient to the user's cabinet"""
        if UserIngredients.checkForIngredient(user_id, ingredient_id) < 1:
            new_bottle = UserIngredients(user_id=user_id, ingredient_id=ingredient_id)
            db.session.add(new_bottle)
            db.session.commit()
        
    @classmethod
    def checkForIngredient(cls, user_id, ingredient_id):
        """Check if a user already has an ingredient in their cabinet"""
        return UserIngredients.query.filter_by(user_id=user_id, ingredient_id=ingredient_id).count()
        
    @classmethod
    def removeIngredient(cls, user_id, ingredient_id):
        """Remove an ingredient from the user's cabinet"""
        UserIngredients.query.filter_by(user_id=user_id, ingredient_id=ingredient_id).delete()
        db.session.commit()


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
        """Parse JSON into dictionary with relevant data"""
        drink = json['drinks'][0]
        drinkInfo = []  
    
        drinkDetails = {}
        drinkDetails['name'] = drink['strDrink']
        drinkDetails['glass'] = drink['strGlass']
        drinkDetails['instructions'] = drink['strInstructions']
        drinkDetails['isAlcoholic'] = drink['strAlcoholic']
        drinkDetails['imgURL'] = drink['strDrinkThumb'].replace('\/', '/')
        
        drinkDetails['ingredients'] = []
        drinkDetails['measures'] = []
        
        ingredients = []
        measures = []
        
        for k, v in drink.items():
            if 'Ingredient' in k and v is not None:
                ingredients.append(v)
                drinkDetails['ingredients'].append(v)
            elif 'Measure' in k and v is not None:
                measures.append(v)
                drinkDetails['measures'].append(v)
        
        drinkInfo.append(drinkDetails)

        return drinkInfo
    
    @classmethod
    def getRandom(cls):
        """Return a random drink"""
        numDrinks = cls.query.count()
        drinkID = randint(0, numDrinks - 1)
        
        return cls.get(drinkID)
        
    
    @property
    def ingredientsList(self) -> list:
        """Return list of ingredient names stored in DB"""
        drinkIngredients = self.ingredients
        
        return [ingredient.name for ingredient in drinkIngredients]


class UserFavorites(db.Model):
    """Class modeling user favorite drinks"""
    __tablename__ = 'user_favorites'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id',
                                                  ondelete='CASCADE',
                                                  onupdate='CASCADE'))
    drink_id = db.Column(db.Integer, db.ForeignKey('drinks.id',
                                                   ondelete='CASCADE',
                                                   onupdate='CASCADE'))
    
    @classmethod
    def add(cls, user_id, drink_id):
        """Add a drink to favorites"""
        fave = cls(user_id=user_id, drink_id=drink_id)
        db.session.add(fave)
        db.session.commit()
        
    @classmethod
    def remove(cls, user_id, drink_id):
        """Remove a drink from favorites"""
        cls.query.filter_by(user_id=user_id, drink_id=drink_id).delete()
        db.session.commit()
        
           
class DrinkIngredient(db.Model):
    """Join table between drinks and ingredients"""
    __tablename__ = 'drink_ingredients'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ingredient_id = db.Column(db.Integer, db.ForeignKey('ingredients.id',
                                                        ondelete='CASCADE',
                                                        onupdate='CASCADE'))
    drink_id = db.Column(db.Integer, db.ForeignKey('drinks.id',
                                                   ondelete='CASCADE',
                                                   onupdate='CASCADE'))