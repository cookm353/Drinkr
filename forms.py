from flask_wtf import FlaskForm
from wtforms import StringField, EmailField, PasswordField
from wtforms.validators import InputRequired, Email, Length
from wtforms_sqlalchemy.fields import QuerySelectField

from models import db, Ingredient

class RegistrationForm(FlaskForm):
    """Form for registering"""
    username = StringField('Username: ',
                           validators=[InputRequired(message='This field is required.')])
    email = EmailField("Email address: ", 
                       validators=[InputRequired(message='This field is required.'), Email()])
    password = PasswordField("Password: ",
                             validators=[InputRequired(message='This field is required.')])

class LoginForm(FlaskForm):
    """Form for logging in"""
    username = StringField('Username: ',
                           validators=[InputRequired(message='This field is required.')])
    password = PasswordField('Password: ',
                             validators=[InputRequired(message='This field is required.')])

class CommentForm(FlaskForm):
    """Form for adding comments"""
    content = StringField("Message: ",
                          validators=[InputRequired(message='This field is required.')])