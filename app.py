from flask import Flask, render_template, redirect, abort, request, g, flash, session
from flask_debugtoolbar import DebugToolbarExtension
from models import connect_db, User, Drink
from forms import RegistrationForm, LoginForm

app = Flask(__name__)
CURR_USER_KEY = 'curr_user'

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///drinkr'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True
app.config['SECRET_KEY'] = 'bottoms_up'
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
debug = DebugToolbarExtension(app)

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
    ...

# General routes

@app.route('/')
def index():
    return render_template('index.html')

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