from flask import Flask, render_template, abort, request, g, flash, session
from flask_debugtoolbar import DebugToolbarExtension
from models import connect_db, User, Drink

app = Flask(__name__)
CURR_USER_KEY = 'curr_user'

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///drinkr'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True
app.config['SECRET_KEY'] = 'bottoms_up'
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
debug = DebugToolbarExtension(app)

connect_db(app)

@app.route('/')
def index():
    return render_template('index.html')

# Sign up, login, logout

@app.before_request
def add_user_to_g():
    """Add curr user to global if user is logged in"""
    
    if CURR_USER_KEY in session:
        g.user = User.get(session[CURR_USER_KEY])
    else:
        g.user = None

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    ...
    
@app.route('/login', methods=['GET', 'POST'])
def login():
    ...
    
@app.route('/logout')
def logout():
    ...

# User related routes

@app.route('/user/<int:userId>')
def user_page(userId):
    user = User.get(userId)
    ...
    
@app.route('/drinks')
def show_drinks():
    ...
    
@app.route('/drinks/<int:drinkId>')
def show_drink(drinkId):
    drink = Drink.get(drinkId)