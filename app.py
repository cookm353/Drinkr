from flask import Flask, render_template, redirect, abort, request, g, flash, session
from flask_debugtoolbar import DebugToolbarExtension
from models import connect_db, User, Drink, Ingredient, DrinkIngredient
from forms import RegistrationForm, LoginForm

app = Flask(__name__)
CURR_USER_KEY = 'curr_user'

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///drinkr'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = False
app.config['SECRET_KEY'] = 'bottoms_up'
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
# debug = DebugToolbarExtension(app)

connect_db(app)

# Sign up, login, logout

@app.before_request
def add_user_to_g():
    """Add curr user to global if user is logged in"""
    
    if CURR_USER_KEY in session:
        g.user = User.get(session[CURR_USER_KEY])
    else:
        g.user = None
        
def do_login(user):
    """Log user in"""
    
    session[CURR_USER_KEY] = user.id
    
def do_logout():
    """Log user out"""
    if CURR_USER_KEY in session:
        del session[CURR_USER_KEY]

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    """Handle user registration"""
    
    form = RegistrationForm()
    
    if form.validate_on_submit():
        formData = {
            'username': form.username.data,
            'password': form.password.data,
            'email': form.email.data            
        }
        try:
            user = User.register(formData)
        except:
            flash('Username already taken', 'danger')
            return render_template('/users/signup.html', form=form)
        
        do_login(user)
        return redirect('/')
        
    else:
        return render_template('users/signup.html', form=form)
    
@app.route('/login', methods=['GET', 'POST'])
def login():
    """Handle user login"""
    form = LoginForm()
    
    if form.validate_on_submit():
        user = User.authenticate(form.username.data,
                                 form.password.data)
        
        if user:
            do_login(user)
            return redirect('/')
            
    
    else:
        return render_template('users/login.html', form=form)
    
@app.route('/logout')
def logout():
    do_logout()
    
    return redirect('/')

# General routes

@app.route('/')
def index():
    return render_template('index.html')

# User related routes

@app.route('/user/<int:userId>')
def user_page(userId):
    user = User.get(userId)
    
    return render_template('/users/user_detail.html', user=user)
    
# Drink related routes

@app.route('/drinks')
def show_drinks():
    """Alphabetical drink list"""
    drinks = Drink.getAll()
    
    return render_template('drinks/drinks.html', drinks=drinks)
    
@app.route('/drinks/<string:drinkName>')
def show_drink(drinkName):
    """Drink detail page"""
    drink = Drink.getByName(drinkName)
    drinkInfo = Drink.getJSON(drink.url)
    ingredients = drink.getIngredients()
    
    return render_template('drinks/drink_detail.html', drinkInfo=drinkInfo, ingredients=ingredients)

# Ingredient 

@app.route('/ingredients')
def show_ingredients():
    """Alphabetical ingredient list"""
    ingredients = Ingredient.getAll()
    
    return render_template('drinks/ingredients.html', ingredients=ingredients)
    
@app.route('/ingredients/<string:ingredientName>')
def show_ingredient(ingredientName):
    """Ingredient detail list"""
    ingredient = Ingredient.getByName(ingredientName)
    
    
    return render_template('drinks/ingredient_detail.html', ingredient=ingredient)