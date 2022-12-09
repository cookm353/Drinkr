# Drinkr

by M. Cook

## Objective

The website will be a convenient resource for looking up mixed drink recipes.  Users will be able to look up cocktail recipes by name or ingredient.  Users will also be able to mark drinks as favorites and leave comments, which would be helpful for annotating recipes.

## Audience

This site will be intended for people of legal drinking age who enjoy dabbling in mixology.

## Data Sources

API: [The Cocktail DB](https://www.thecocktaildb.com/api.php)
Database: PostgreSQL

The API will be used to retrieve information on the drinks, and the database will store information on the users, comments left on drinks, ingredients they own, and what their favorite drinks are.

## Approach

### Schema

![Database schema for Drinkr](static/images/db_schema.png "Schema")

### User Flow

Users will be able to use the site whether they create an account or not, but some features and pages will be restricted to users who are logged in.  

#### Logged Out

From the home page, users can make an account, log into their account, view drinks, view ingredients, or view the detail page for a random drink.  The user can view the list of drinks or ingredients in alphabetical order, and open the detail page for each drink/ingredient.

The drink detail page provides the recommended glass, ingredients and amounts, directions, and any comments that have been left.  Users can also access the ingredient detail page for each ingredient if one exists.

THe ingredient detail page displays the recipes available for ingredient, along with links to the drink detail page.

#### Logged In

The key features available to users who are logged in are the ability to add ingredients to their cabinet, save drinks to their favorites, and leave comments on drink detail pages.

The cabinet page contains three collapsible sections.  The first displays the ingredients in a user's cabinet in a similar fashion to the drink and ingredient display pages.  The second contains a form to add an ingredient to their cabinet.  The final one shows a list of drinks that use the ingredients the user has in their cabinet.

The favorites page displays drinks the user has added to their favorites, and has links to the detail page for each drink.

The ingredient detail page has a button that can be used to add a given ingredient to the user's cabinet.  The drink detail page has a button that can be used to add the drink to their favorites and a form for adding new comments.

### Sensitive Information

- Usernames and passwords
  - Passwords will be hashed using Bcrypt
  - A user's email address, first name, and last name will only be visible to the user

### Technology Stack

- Frontend: HTML, CSS, Bootstrap, JavaScript (jQuery, TypeScript, Axios)
- Backend: Python (Flask, SQLAlchemy, WTForms, Jinja, Bcrypt), Postgres

### Database backup

```bash
pg_dump -U matt drinkr > drinkr.pgsql
```

### To-Do

- [ ] Write tests
  - [x] Tests for models
  - [ ] Tests for app
    - [ ] Figure out why the tests won't run properly
- [ ] Fix type setting issues
  - [ ] Larger font size for `<p>` elements should only be on the front page
  - [ ] Make sure the names of drinks nad recipes wrap in the cards

### Reflections and Takeaways

- Not every form/input needs to be secured against CSRF
- Taking some time to create a plan of action helps a lot
- Adding print statements when executing a program that takes a while is a good way to keep track of progress (and make sure it hasn't frozen)
- UI/UX design and writing copy for your site can be hard if you aren't used to it
- If you're creating an app which needs several files to be run first to set everything up, create a master set up script (along with print statements to keep track of progress!)
- You'll probably have to do some data cleaning when you're working with an API

DB URL: postgresql-infinite-43802